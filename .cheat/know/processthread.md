孤儿进程：一个父进程退出，而它的一个或多个子进程还在运行，那么那些子进程将成为孤儿进程。孤儿进程将被init进程(进程号为1)所收养，并由init进程对它们完成状态收集工作。

僵尸进程：一个进程使用fork创建子进程，如果子进程退出，而父进程并没有调用wait或waitpid获取子进程的状态信息，那么子进程的进程描述符仍然保存在系统中。这种进程称之为僵死进程。

1 min 5 min 15 min load average process num

可运行状态和不可中断状态的平均进程数
不可中断状态进程是 ps 命令的 D 状态 uninterruptible sleep or disk sleep
R running
D disk sleep / uninterruptible sleep
Z zombie 进程已经结束了，但是父进程还没有回收资源 比如进程描述符 PID
S interruptible sleep
I idle
T stopped/ traced 比如调试中，ctrl-z
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

## interrupt
网卡接收到数据包,通过**硬件中断**,通知内核有新的数据
内核调用中断处理程序来响应它
上半部:快速处理,把网卡的数据读到内存中,然后更新一下硬件寄存器的状态(表示数据已经读好了),最后再发送一个软中断信号,通知下半部做进一步的处理。
下半部被软中断信号唤醒后,需要从内存中找到网络数据,再按照网络协议栈,对数据进行逐层解析和处理,直到把它送给应用程序
上半部直接处理硬件请求,也就是我们常说的硬中断,特点是快速执行;
而下半部则是由内核触发,也就是我们常说的软中断,特点是延迟执行。
实际上, 上半部会打断CPU正在执行的任务, 然后立即执行中断处理程序。
而下半部以内核线程的方式执行, 并且每个CPU都对应一个软中断内核线程, 名字为 “ksoftirqd/CPU编号”
不过要注意的是,软中断不只包括了刚刚所讲的硬件设备中断处理程序的下半部,  一些内核自定义的事件也属于软中断, 比如内核调度和RCU锁(Read-Copy Update的缩写, RCU是 Linux内核中最常用的锁之一) 等。

/proc/softirqs soft interrupt
/proc/interrupts hard interrupt


## memory
top
VIRT 虚拟内存的大小，进程申请的内存大小，包括还没有真正分配的
RES 常驻内存的大小，实际使用的物理内存大小，但不包括 Swap 和共享

Buffer 内核缓冲区用到的内存
