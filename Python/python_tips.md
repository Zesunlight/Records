# 北邮-陈光-Python编程与实践-笔记

## Tools

### windows cmd / powershell

- 输入python进入后，ctrl+Z / exit() / quit()
- ipython，ctrl+D 退出
- alias，别名

### splash screen

启动界面，软件启动的时候给张图，它自己加载一些东西，让用户不觉得那么无聊

## Python Grammar

### python 引用、变量

- 给变量赋不可变值，给该值在内存中分配空间，该值的指针（内存地址）的引用给变量
- 可变元素的值改变，地址不变，可变类型不可hash
- 字符串、整数、元组是不可变的
- 传进函数里的可变参数，会改变原有的参数

### 空

- None，是“什么都不是”
- pass，做“什么都不做”

### 相等

- is 比较的是两个对象的 id 值是否相等，也就是比较两个对象是否为同一个实例对象，是否指向同一个内存地址
- == 比较的是两个对象的内容是否相等，默认会调用对象的`__eq__()`方法

### 函数

- 定义时可以写出输入输出的类型，但只是提示作用，解释器不会检查
- 增加 docstring，使用 help() 时会输出
- 默认形参值会在执行函数定义时按从左至右的顺序被求值

#### 重载

```python
from mm import multimethod

@multimethod(int, int)
def foo(a, b):
    ...code for two ints...

@multimethod(float, float):
def foo(a, b):
    ...code for two floats...

@multimethod(str, str):
def foo(a, b):
    ...code for two strings...
```

### 类

- 比函数更高级的封装，函数和变量的封装
- 类变量可以是成员函数都需要的变量
- 实例变量，有self.的，在实例化时才分配空间，属于某个实例；类变量，无self.，属于该类，所有实例共享
- 元类，定义类的类

## 库

### 查用法

`help(func)` `dir(func)` `func?` 

%pdb ，魔法函数，用于调试

### pickle

- `dump()`，假设数据是海报，卷起来放好
- `load()`，海报展开来呈现

### 随机数

random、time.time()、hash()、id()

### 过滤

- `filter()` 

### 生成器

- `yield` ，带有它的函数是一个生成器
- 用 next() 执行生成器，遇到 yield 的时候暂停，并返回该值，下一次的时候继续

### 迭代器

- 定义 [`__iter__()`](https://docs.python.org/zh-cn/3/reference/datamodel.html#object.__iter__) 方法，返回一个带有 [`__next__()`](https://docs.python.org/zh-cn/3/library/stdtypes.html#iterator.__next__) 方法的**对象** 
- 如果类已定义了 `__next__()`，则 [`__iter__()`](https://docs.python.org/zh-cn/3/reference/datamodel.html#object.__iter__) 可以简单地返回 `self`
- `__next__()` 自定义取下一个元素的方法，并返回下一个元素

## 杂项

- hash，判断这个数据在之前见过没有
- 有些文件的头可能是一些标志位，表示是什么编码格式
- cheat sheet，小抄，速查
- 先用正则匹配想要的内容，加一个换行再替换，根据此规则重新用正则来替换不需要的内容
- `.*?` 非贪婪匹配，[小技巧](https://www.bilibili.com/video/BV1b7411N7P2?p=20) 
- UTF-8 实际上不需要 BOM，有 BOM 的用 UTF-8-sig 读取

## 参考

- https://docs.python.org/zh-cn/3/contents.html
- https://codingpy.com/books/thinkpython2/index.html
- https://regexr.com/
- 