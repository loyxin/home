# linux

## 实践

### 进程

1 min 5 min 15 min load average process num

可运行状态和不可中断状态的平均进程数
不可中断状态进程是 ps 命令的 D 状态 uninterruptible sleep or disk sleep

R running
D disk sleep / uninterruptible sleep
一般表示进程正在和硬件交互，并且交互过程不允许被其他进程中断或是打断。
Z zombie 进程已经结束了，但是父进程还没有回收资源 比如进程描述符 PID
S interruptible sleep
表示进程因为等待某个事件而被系统挂起。当进程等待的事件发生，他会被唤醒进入R状态。
I idle
用在不可中断睡眠的内核线程觞。这类进程不会导致负载升高。
T stopped/ traced 比如调试中，ctrl-z
T是stopped或traced缩写，表示进程处于暂停或跟踪状态。debug
X Dead

vmstat
cs context switch
in interrupt
r running 就绪队列的长度
b blocked 不可中断睡眠状态的进程数
us user sy system idle id
irq hi 硬中断的cpu时间 iowait 等待io的cpu时间
softirp si 软中断的cpu时间
steal st 系统运行在虚拟机中，被其他虚拟机占用的cpu时间
guest 运行虚拟机的时间

## memory
top
VIRT 虚拟内存的大小，进程申请的内存大小，包括还没有真正分配的
RES 常驻内存的大小，实际使用的物理内存大小，但不包括 Swap 和共享

Buffer 内核缓冲区用到的内存

### 权限

权限属性列表为10个字符：
第一个字符表示文件类型，d为目录 -为普通文件 l为连接 b为可存储的接口设备 c为键盘鼠标等输入设备

2、3、4个字符表示所有者权限，5、6、7个字符表示所有者同组用户权限，8、9、10为其他用户权限
umask是unix操作系统的概念，umask决定目录和文件被创建时得到的初始权限
umask = 022 时，新建的目录 权限是755，文件的权限是 644
umask = 077 时，新建的目录 权限是700，文件的权限时 600

setuid是文件的扩展属性，经常我们会用到的是777或者755等等，加了setuid就成了6777 4755等等，setuid是4，setgid是2.

chmod g+s file; setgid
Set UID (SUID)；設置使文件在執行階段具有文件所有者的權限。
Set GID (SGID)：只對目錄有效。
Sticky Bit (SBIT)：防刪除屬性，只對目錄有效
4 為 SUID
2 為 SGID
1 為 SBIT

### 信号量
进程之间可以互相通过系统调用kill发送软中断信号。
SIGHUP 1 A 终端挂起或者控制进程终止
SIGINT 2 A 键盘中断（如break键被按下）
SIGQUIT 3 C 键盘的退出键被按下
SIGILL 4 C 非法指令
SIGABRT 6 C 由abort(3)发出的退出指令
SIGFPE 8 C 浮点异常
SIGKILL 9 AEF Kill信号
SIGSEGV 11 C 无效的内存引用
SIGPIPE 13 A 管道破裂: 写一个没有读端口的管道


### password
/etc/passwd 注：用户（user）的配置文件；
用户: 密码 : uid  : gid :用户描述：家目录：登陆shell
/etc/shadow 注：用户（user）影子口令文件；存passwd
passwd 放到 /etc/shadow
paswd口令不再直接保存在passwd文件中，通常将passwd文件中的口令字段使用一个“x”来代替，将/etc /shadow作为真正的口令文件，用于保存包括个人口令在内的数据。当然shadow文件是不能被普通用户读取的，只有超级用户才有权读取。
/bin/false是最严格的禁止login选项，一切服务都不能用，而/sbin/nologin只是不允许系统login，可以使用其他ftp等服务

/etc/group
group_name:passwd:GID:user_list

/etc/shadow
用户名:加密密码:最后一次修改时间:最小修改时间间隔:密码有效期:密码需要变更前的警告天数:密码过期后的宽限天数:账号失效时间
Linux 计算日期的时间是以1970 年 1 月 1 日作为 1 不断累加得到的时间，到 1971 年 1 月 1 日，则为 366 天


### 程序运行
ELF  Executable and Linkable Format
脚本/解释器

```
#! .....
```
当内核加载一个文件时，会首先读取文件的前 128 个字节，根据这 128 个字节判断文件的类型，然后调用相应的加载器来加载。

比如说，内核发现当前是一个 ELF 文件（ELF 文件前四个字节为固定值，称为魔数），那么就调用 ELF 加载器。
7f 45 4c 46 后面3个字节刚好是ELF这3个字母的ASCII码

内核中有一个加载器叫做 binfmt_misc，看名字可以知道，这个加载器用于处理各种各样非标准的其他类型。
https://zh.wikipedia.org/wiki/Binfmt_misc

### 文件系统

/mnt  Mounted file-systems
/opt  Optional software
/usr  User-oriented software
/var  Various other files: mail, spooling and logging

### 环境变量

LIBRARY_PATH is used by gcc before compilation to search directories containing static and shared libraries that need to be linked to your program.

LD_LIBRARY_PATH is used by your program to search directories containing shared libraries after it has been successfully compiled and linked.

### tips

简要说明命令的作用 whatis command
更加详细的说明文档 info command
查看路径 which command
查看程序的搜索路径 whereis command
locate会为文件系统建立索引数据库
getfacl 查看 文件权限
setfacl    -m    u:lee:rwx    /mnt/file   设定lee用户对file文件可以读写执行

## 理论
### 进程
进程上下文切换开销
直接开销就是在切换时，cpu必须做的事情，包括
1、切换页表全局目录
2、切换内核态堆栈
3、切换硬件上下文（进程恢复前，必须装入寄存器的数据统称为硬件上下文）
4、刷新TLB
5、系统调度器的代码执行

平均每次上下文切换耗时3.5us左右
间接开销主要指的是虽然切换到一个新进程后，由于各种缓存并不热，速度运行会慢一些。

轻量级进程和普通进程的区别是可以共享同一内存地址空间、代码段、全局变量、同一打开文件集合而已。
线程实现 linux 方式
从上下文切换的耗时上来看，Linux线程（轻量级进程）其实和进程差别不太大。
同一进程下的线程之所有getpid()看到的pid是一样的，其实task_struct里还有一个tgid字段。 对于多线程程序来说，getpid()系统调用获取的实际上是这个tgid，因此隶属同一进程的多线程看起来PID相同。
need_resched: 在调度时机到来时，检测这个域的值，如果为1，则调用schedule() 。
counter: 进程处于运行状态时所剩余的时钟滴答数，每次时钟中断到来时，这个值就减1。当这个域的值变得越来越小，直至为0 时，就把need_resched 域置1，因此，也把这个域叫做进程的“动态优先级”。

孤儿进程：一个父进程退出，而它的一个或多个子进程还在运行，那么那些子进程将成为孤儿进程。孤儿进程将被init进程(进程号为1)所收养，并由init进程对它们完成状态收集工作。

僵尸进程：一个进程使用fork创建子进程，如果子进程退出，而父进程并没有调用wait或waitpid获取子进程的状态信息，那么子进程的进程描述符仍然保存在系统中。这种进程称之为僵死进程。

### 中断
为了解决中断处理程序执行过长和中断丢失的问题，将中断过程分成了两个阶段，分别是「上半部和下半部分」。
上半部用来快速处理中断，一般会暂时关闭中断请求，主要负责处理跟硬件紧密相关或者时间敏感的事情。
下半部用来延迟处理上半部未完成的工作，一般以「内核线程」的方式运行。
上半部直接处理硬件请求,也就是我们常说的硬中断,特点是快速执行;
而下半部则是由内核触发,也就是我们常说的软中断,特点是延迟执行。

网卡接收到数据包,通过**硬件中断**,通知内核有新的数据
内核调用中断处理程序来响应它
上半部:快速处理,把网卡的数据读到内存中,然后更新一下硬件寄存器的状态(表示数据已经读好了),最后再发送一个软中断信号,通知下半部做进一步的处理。
下半部被软中断信号唤醒后,需要从内存中找到网络数据,再按照网络协议栈,对数据进行逐层解析和处理,直到把它送给应用程序
实际上, 上半部会打断CPU正在执行的任务, 然后立即执行中断处理程序。
而下半部以内核线程的方式执行, 并且每个CPU都对应一个软中断内核线程, 名字为 “ksoftirqd/CPU编号”
不过要注意的是,软中断不只包括了刚刚所讲的硬件设备中断处理程序的下半部,  一些内核自定义的事件也属于软中断, 比如内核调度和RCU锁(Read-Copy Update的缩写, RCU是 Linux内核中最常用的锁之一) 等。

/proc/softirqs soft interrupt
/proc/interrupts hard interrupt


网卡收到网络包后，会通过硬件中断通知内核有新的数据到了，于是内核就会调用对应的中断处理程序来响应该事件，这个事件的处理也是会分成上半部和下半部。
上部分要做到快速处理，所以只要把网卡的数据读到内存中，然后更新一下硬件寄存器的状态，比如把状态更新为表示数据已经读到内存中的状态值。
接着，内核会触发一个软中断，把一些处理比较耗时且复杂的事情，交给「软中断处理程序」去做，也就是中断的下半部，其主要是需要从内存中找到网络数据，再按照网络协议栈，对网络数据进行逐层解析和处理，最后把数据送给应用程序。

在 Linux 系统里，我们可以通过查看 /proc/softirqs 的 内容来知晓「软中断」的运行情况，以及 /proc/interrupts 的 内容来知晓「硬中断」的运行情况。

中断处理函数，然后把中断处理函数的入口地址注册在IDT
Programmable Interval Timer PIT
定时器每隔多少秒就产生一次中断

0x20也就是定时器中断。0x0~0x1f都是CPU异常所使用的中断。0x00是除零异常；0x06是非法指令异常；之前介绍的0x0d是一般保护异常；0x0c是栈异常。
