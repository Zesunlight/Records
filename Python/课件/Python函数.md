# 函数

- 定义一个函数要使用`def`语句，依次写出函数名、括号、括号中的参数和冒号`:`，然后，在缩进块中编写函数体，函数的返回值用`return`语句返回。
- 如果想定义一个什么事也不做的空函数，可以用`pass`语句。实际上`pass`可以用来作为占位符，比如现在还没想好怎么写函数的代码，就可以先放一个`pass`，让代码能运行起来。
- 函数执行完毕也没有`return`语句时，自动`return None` 

## 局部变量、全局变量

```python
num = 100
def func():
    num = 123
    print(num)
func()

num = 100
def func():
    num += 100
    print(num)
func()

a = [1, 2]
def func():
    a.append(3)
    print(a)
func()

num = 100
def func():
    num = 200
    x = num + 100
    print(x)
func()

num = 100
def func():
    global num
    num = 200
    print(num)
func()
print(num)
```

- 只要是使用变量，而该变量在全局域中有定义，而在局部没有定义，则会使用全局变量。

## 参数

```python
def test(x:int, y:int) -> int:
    '''x and y must be integers, return an integer x+y'''
    assert isinstance(x, int), 'x must be integer'
    assert isinstance(y, int), 'y must be integer'
    z = x+y
    assert isinstance(z, int), 'must return an integer'
    return z
```

- 位置参数（positional arguments）是比较常用的形式，调用函数时实参和形参的顺序必须严格一致，并且实参和形参的数量必须相同。

- 默认值参数必须出现在函数参数列表的最右端，任何一个默认值参数右边不能有非默认值参数。

- 调用带有默认值参数的函数时，可以不对默认值参数进行赋值，也可以为其赋值，具有很大的灵活性

- 默认值参数只在函数定义时被解释一次

- 通过关键参数，**实参顺序可以和形参顺序不一致**，但不影响传递结果，避免了用户需要牢记位置参数顺序的麻烦

- *parameter用来接受多个实参并将其放在一个**元组**中

  \**parameter接受关键参数并存放到**字典**中

## 模块

- 在计算机程序的开发过程中，随着程序代码越写越多，在一个文件里代码就会越来越长，越来越不容易维护。
- 一个`abc.py`的文件就是一个名字叫`abc`的模块，一个`xyz.py`的文件就是一个名字叫`xyz`的模块。
- 每一个包目录下面都会有一个`__init__.py`的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包。`__init__.py`可以是空文件，也可以有Python代码，因为`__init__.py`本身就是一个模块，而它的模块名就是包名。
- 自己创建模块时要注意命名，不能和Python自带的模块名称冲突
- https://docs.python.org/zh-cn/3/library/datetime.html
- 在计算机中，时间实际上是用数字表示的。我们把1970年1月1日 00:00:00 UTC+00:00时区的时刻称为epoch time，记为`0`（1970年以前的时间timestamp为负数），当前时间就是相对于epoch time的秒数，称为timestamp。
- https://docs.python.org/zh-cn/3.8/library/json.html

