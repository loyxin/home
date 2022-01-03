# 分区表的介绍

## mbr

看wiki
https://zh.wikipedia.org/wiki/%E4%B8%BB%E5%BC%95%E5%AF%BC%E8%AE%B0%E5%BD%95
4个分区, 512b
P primary
E extend

bootloader 代码区一共 440 bit 一般
440 bit处 选用磁盘标志 4 bit
最后2个 一般为空值; 0x0000
446
DPT 一个分区 disk partition table
引导标志
若值为80H表示活动分区，若值为00H表示非活动分区 其它数值没有意义
起始号 磁头号 HEAD 扇区号 SECTOR 磁柱号（CYLINDER）
文件系统标志位
分区结束
逻辑起始扇区号 ，本分区之前已用了的扇区数。
本分区的总扇区数。

因为扩展分区最多只能有一个，所以硬盘最多可以有四个主分区或者三个主分区，一个扩展分区

## GPT
GPT也使用逻辑区块地址（LBA）取代了早期的CHS寻址方式

传统MBR信息存储于LBA 0，GPT头存储于LBA 1，接下来才是分区表本身。
1 个LBA 存4个分区

前34 后 34 sector 都是 gpt
2-33 是分区

一般看见磁盘start 2048 其意思也就是由于EFI的兴起，要给EFI 代码留磁盘最开始的1M空间

1 mbr
2 primary gpt header
3 4个分区 一个分区128bit
3-34 128 分区

https://zh.wikipedia.org/wiki/GUID%E7%A3%81%E7%A2%9F%E5%88%86%E5%89%B2%E8%A1%A8

分区表头定义了硬盘的可用空间以及组成分区表的项的大小和数量。
分区表头还记录了这块硬盘的GUID，记录了分区表头本身的位置和大小（位置总是在LBA 1）以及备份分区表头和分区表的位置和大小（在硬盘的最后）
它还储存着它本身和分区表的CRC32校验。

硬盘GUID
分区类型GUID
分区GUID
gdisk code 8300 for Linux filesystem

分区表项
一个分区表项的前16字节是分区类型GUID。例如，EFI系统分区的GUID类型是{C12A7328-F81F-11D2-BA4B-00A0C93EC93B}。接下来的16字节是该分区唯一的GUID（这个GUID指的是该分区本身，而之前的GUID指的是该分区的类型）。再接下来是分区起始和末尾的64位LBA编号，以及分区的名字和属性


文件系统

一个扇区大小512B，但硬盘在进行文件操作时并非以扇区为单位，而是——簇，“簇”是系统进行分配的最小单位，一个簇可以包含多个扇区，假设目前一个簇包含4个扇区，簇大小为2KB，一个文件大小恰为2KB，则占用了簇的所有可用空间，即便你有一个1B大小的文件需要保存，那么你占用的空间也是一个簇，簇内其他空间不可读写。

所以分区4K对齐

physical sector & logical sector

只要这个起始扇区号能够被8整除就都可以
默认对齐的扇区数是2048


EFI系统分区（英语：EFI system partition，简写为ESP）

action:

1. parted /dev/
mklabel gpt
2. gdisk -l /dev/nvme0n1
see aligned on 2048-sector boundaries

3 fdisk 分区 改t
4 parted 改名字, 权限
5 文件系统

这样建立 gpt
pmbr 只有一个分区 的信息


# efi
efi默认是去执行uefi分区的/efi/boot/bootx64.efi这个文件

partition uuid
sudo blkid /dev/nvme0n1p2

## uuid
UUID，是Universally Unique Identifier的缩写

gpt LBA1 表头 有一个硬盘 uuid
sudo blkid /dev/nvme0n1 可以看到，其中的 ptuuid 也可以读 block

分区表有 分区类型GUID -- 指明是什么分区类型 比如 esp 
分区GUID  可以 通过 sudo blkid /dev/nvme0n1p1 其中的partuuid 也可以读 block 

接着在格式化中，会在超级块中生成一个 UUID，识别不同

UUID is a filesystem-level UUID, which is retrieved from the filesystem metadata inside the partition. That can only be read if the filesystem type is known and readable.

PARTUUID is a partition-table-level UUID for the partition, a standard feature for all partitions on GPT-partitioned disks. Since it is retrieved from the partition table, it is accessible without making no assumptions at all about the actual contents of the partition. If the partition is encrypted using some unknown encryption method, this might be the only accessible unique identifier for that particular partition.

PTUUID is the UUID of the partition table itself, a unique identifier for the entire disk assigned at the time the disk was partitioned. It's the equivalent of disk signature on MBR-partitioned disks, but with more bits and standardized procedure for its generation.
UUID可以持久唯一标识一个硬盘分区


mklabel gpt

name 1 boot
set 1 boot on
name 2 rootfs

## microsoft
微软保留分区（MicrosoftReservedPartition，缩写MSR）是使用GUID分区表（GPT）储存装置的必需分区。
其全局唯一标识符（GUID）为E3C9E316-0B5C-4DB8-817D-F92DF00215AE。这个分区只适用于使用GUID分区表的存储器而不适用于使用传统的主引导记录（MBR）分区表的存储器。根据微软的文档，这个分区的用途目前是保留的，暂时不会保存有有用的数据，未来可能用作某些特殊用途。
　　在将存储器格式化为使用GUID分区表时，微软保留分区就会自动分出，并不能删除。微软保留分区的位置必须在EFI系统分区（ESP）和所有OEM服务分区之后，但是紧接在第一个数据分区之前。对于不大于16GB的存储器上，微软保留分区的初始大小为32MB；在更大的存储器上，其初始大小为128MB。但是它的大小在后续的使用中可能自动缩小，例如在把基本磁盘（basicdisk）转换为动态磁盘（dynamicdisk）时。

