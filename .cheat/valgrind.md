## Valgrind
Valgrind 是运行在Linux上一套基于仿真技术的程序调试和分析工具
- memcheck：检查程序中的内存问题，如泄漏、越界、非法指针等。
- callgrind：检测程序代码覆盖，以及分析程序性能。
- cachegrind：分析CPU的cache命中率、丢失率，用于进行代码优化。
- helgrind：用于检查多线程程序的竞态条件。
- massif：堆栈分析器，指示程序中使用了多少堆内存等信息。

### Memcheck
- 对未初始化内存的使用；
- 读/写释放后的内存块；
- 读/写超出malloc分配的内存块；
- 读/写不适当的栈中内存块；
- 内存泄漏，指向一块内存的指针永远丢失；
- 不正确的malloc/free或new/delete匹配；
- memcpy()相关函数中的dst和src指针重叠。

### usage

` valgrind --log-file=vargrind.log --tool=memcheck --leak-check=full ./main(运行程序)`
