# 题目 12
To speed up data access , we build cache system. In one system , The L1 cache access time is 5 ns , the L2 cache access time is 50 ns and the memory access time is 400 ns. The L1 cache miss rate is 50% , the L2 cache miss rate is 10%. The average data access time of this system is:

### 正确答案及解析
``0.5*5+0.5*0.9*（50+5）+0.5*0.1*（400+50+5）=50``
# 题目 89
二进制地址为011011110000，大小为（4）10和（16）10块的伙伴地址分别为： ? ， ? 。

### 正确答案及解析
答案：011011110100, 011011100000

均为十进制，大小分别为 4 和 16

![解释](http://uploadfiles.nowcoder.com/images/20150826/569118_1440576972606_D14C2D2644FD4B5F5BC9D05B22B8B386)



# 题目 99
某指令流水线由 5 段组成，各段所需要的时间分别是：t、3t、t、2t 和 t 。问如果连续执行 10 条指令，则吞吐率是多少 ?

### 正确答案及解析
答案：0.2857/t

[参考博客](http://blog.csdn.net/wangjian8855/article/details/12711009)

自己画出指令执行的时空图，可以看出执行第n条指令的时间是：`8t+(n-1)*3t`

而吞吐率＝指令/时间＝`10/(8t+9*3t)=10/35*t=0.2857t`


## bit
bit
一位
byte 字节
8 位

01010101
8 b

存储单位和网速的单位，不管是 B 还是 b，代表的都是 字节 Byte。
带宽的单位，不管是 B 还是 b，代表的都是 比特 bit 。

一个字节的字长是8 bit 1 byte
一个字的字长为16 1 word

