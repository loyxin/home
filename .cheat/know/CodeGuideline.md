# code guideline

## name
目录名 小写单词
namespace 小写单词 和 目录名 保持一致
文件名 类名 大驼峰
函数名 变量名 小驼峰
小驼峰
全局变量 g 开头
静态变量 s 开头
枚举变量 e 开头
成员变量 m 开头
函数参数 vim can show param

像 Pi E
全局静态常量 可能有些 大写

宏 全部大写 单词下划线

## 结构
比如 有一个 util 目录
里面的 infra 目录是给 util 用的
util 是给项目用的
namespace 有 util 和 util/infra

detail namespace 要加 对应目录
比如 util/image
namespace util{
    namespace image{
        namespace detail{

        }
    }
}

## header file
```cpp
#pragma once
```
Order: related header, C system headers, C++ standard library headers, other libraries' headers, your project's headers.

## tips
返回指针 如果不可能为空就正确类型，可能返回空指针 std::option
- 谁申请谁管理释放
new开头的函数 都是 外面管理内存
get 函数不要 delete

一个函数里面申请内存，填值，返回，用智能指针包
调用该函数得到指针，就不用管理内存了
智能指针帮助管理内存


## private
easy:
```cpp
// out interface
#include "classaPrivate.h"

class a{

private:
	classaPrivate m_a;
};
```

pImpl

template
template guard
can see the private function


copy shallow copy
clone deep copy
return unique_ptr
operator= shallow copy

copy(ptr) for memory pool


static init function for factory method
