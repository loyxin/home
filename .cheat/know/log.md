# log

## guideline

异常 错误码 log assert

assert guard input and ouput for unittest
错误码 用于终止于给外部调用的函数的接口
log: record flow for user debug like gdb

### 异常
异常： 子模块的功能函数多个失败状态，上层模块拼接，并不能handle
异常最大好处是可以错误逻辑和正常逻辑分开
usage:
不包含准备 input 过程中出现问题
计算过程可能会出现问题
上层调用不应该知道下层的错误 但是更上层可能知道
可以判断出一个问题上层无论如何都处理不了，就建议直接抛出异常 & log

NullptrException->assert
越界异常->assert
ClassCastException(类型转换异常)
AruthmeticException(算术异常)
BufferOverflowException(缓冲区溢出异常)

### 错误码
usage:
不包含准备 input 过程中出现问题
直接的 input -> assert
module error not for RD user

## log

### level
error:

warning:

info:
log flow, input, output


## bug

编译器
静态code 检查

需求不清晰
设计缺陷

方法功能描述
参数定义及合法性要求
调用线程环境要求
返回值定义
当参数不合法时，方法的行为
当出现其他错误时，方法的行为
当方法正常返回时，相关对象(系统)的状态
当方法抛出异常时，相关对象(系统)的状态

