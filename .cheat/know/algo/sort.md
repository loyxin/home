# 题目 140
最坏情况下 insert sort, quick sort ,merge sort 的复杂度分别是多少？
* `O(n*n),O(nlogn),O(n*n)`
* `O(n*n),O(n*n),O(nlogn)`
* `O(n*n),O(nlogn),O(nlogn)`
* `O(nlogn),O(nlogn),O(nlogn)`

### 正确答案及解析
答案：B

```
1：简单选择  最好时间 O(n^2)      平均时间O(n^2)      最坏时间 O(n^2)
2：直接插入  最好时间 O(n)         平均时间O(n^2)      最坏时间 O(n^2)
3：冒泡排序  最好时间 O(n)         平均时间O(n^2)      最坏时间 O(n^2)
4：希尔排序  最好时间 O(n)         平均时间O(logn)     最坏时间 O(n^s) 1<s<2
5：快速排序  最好时间 O(nlogn)  平均时间O(nlogn)   最坏时间O(n^2) 
6：堆排序      最好时间 O(nlogn)  平均时间O(nlogn)   最坏时间O(nlogn) 
7：归并排序  最好时间 O(nlogn)  平均时间O(nlogn)   最坏时间O(nlogn)
```
