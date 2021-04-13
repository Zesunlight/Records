# Python 变量

```python
dir(obj)            # 简单的列出对象obj所包含的方法名称，返回一个字符串列表
help(obj.func)      # 查询obj.func的具体介绍和用法
```

## 数字类型

### 整型

```python
0o177, 0x9ff, 0b101010      # 八进制、十六进制、二进制数字
hex(I), oct(I), bin(I)      # 将十进制数转化为十六进制、八进制、二进制表示的“字符串”
int(string, base)           # 将字符串转化为整数，base为进制数
isinstance(False, int)       # bool类型属于整型，所以返回True
```

16进制，前面加`0x`修饰，后面使用数字0-9A-F：

```
0xFF
255
```

8进制，前面加`0o`修饰，后面使用数字0-7：

```
067
55
```

2进制，前面加`0b`修饰，后面使用数字0或1：

```
0b101010
42
```

### 浮点型

- `type(45.3)` 

- `round(a, 3)` `round(a, -1)` 

  传给 `round()` 函数的 `ndigits` 参数可以是负数，这种情况下， 舍入运算会作用在十位、百位、千位等上面。

  碰到.xxx5的情况时，如果要取舍的位数前的数是奇数，则直接舍弃.xxx5，如果是偶数则向上取舍

  当一个值刚好在两个边界的中间的时候， `round` 函数返回离它最近的**偶数** 

- `float('inf'), float('-inf')` 

- 浮点数的一个普遍问题是它们并不能精确的表示十进制数。 并且，即使是最简单的数学运算也会产生小的误差。这些错误是由底层CPU和IEEE 754标准通过自己的浮点单位去执行算术时的特征。 由于Python的浮点数据类型使用底层表示存储数据，因此你没办法去避免这样的误差。

  ```python
  a = 4.2
  b = 2.1
  >>> a + b
  6.300000000000001
  >>> (a + b) == 6.3
  False
  ```

### 复数

- 复数的虚数部分通过后缀“J"或“j”表示

- 如果要执行其他的复数函数比如正弦、余弦或平方根，使用 `cmath` 模块

  ```python
a = complex(2, 4)
a.real
a.imag
a.conjugate()
cmath.sin(a)
  cmath.cos(a)
  cmath.exp(a)
  cmath.sqrt(-1)
  ```

## 字符串

- 字符串的生成，单引号与双引号是等价的

- 三引号用来输入包含多行文字的字符串

- `ord('A')` `chr(65)` 

- 以字母r或R引导的表示原始字符串

- 切片使用2个冒号分隔的3个数字来完成：
  第一个数字表示切片开始位置（默认为0）。
  第二个数字表示切片截止（但不包含）位置（默认为列表长度）。
  第三个数字表示切片的步长（默认为1），当步长省略时可以顺便省略最后一个冒号。
  
- ```python
  str1 = "stringobject"
  str1.upper(); str1.lower(); str1.swapcase(); str1.capitalize(); str1.title()        
  # 全部大写，全部小写、大小写转换，首字母大写，每个单词的首字母都大写
  str1.ljust(width)                       # 获取固定长度，左对齐，右边不够用空格补齐
  str1.rjust(width)                       # 获取固定长度，右对齐，左边不够用空格补齐
  str1.center(width)                      # 获取固定长度，中间对齐，两边不够用空格补齐
  str1.zfill(width)                       # 获取固定长度，右对齐，左边不足用0补齐
  str1.find('t',start,end)                # 查找字符串，可以指定起始及结束位置搜索
  str1.rfind('t')                         # 从右边开始查找字符串
  str1.count('t')                         # 查找字符串出现的次数
  #上面所有方法都可用index代替，不同的是使用index查找不到会抛异常，而find返回-1
  str1.replace('old','new')               
  # 替换函数，替换old为new，参数中可以指定maxReplaceTimes，即替换指定次数的old为new
  str1.strip();                           # 默认删除空白符
  str1.strip('d');                        # 删除str1字符串中开头、结尾处，位于 d 删除序列的字符
  str1.lstrip();
  str1.lstrip('d');                       # 删除str1字符串中开头处，位于 d 删除序列的字符
  str1.rstrip();
  str1.rstrip('d')                        # 删除str1字符串中结尾处，位于 d 删除序列的字符
  str1.startswith('start')                # 是否以start开头
  str1.endswith('end')                    # 是否以end结尾
  str1.isalnum(); str1.isalpha(); str1.isdigit(); str1.islower(); str1.isupper()      
  # 判断字符串是否全为字符、数字、小写、大写
  ```

## 列表

```python
L = [[1, 2], 'string', {}]                  # 嵌套列表
L = list('spam')                            # 列表初始化
L = list(range(0, 4))                       # 列表初始化
list(map(ord, 'spam'))                      # 列表解析
len(L)                                      # 求列表长度
L.count(value)                              # 求列表中某个值的个数
L.append(obj)                               # 向列表的尾部添加数据，比如append(2)，添加元素2
L.insert(index, obj)                        # 向列表的指定index位置添加数据，index及其之后的数据后移
L.extend(interable)                         # 通过添加iterable中的元素来扩展列表，比如extend([2])，添加元素2，注意和append的区别
L.index(value, [start, [stop]])             # 返回列表中值value的第一个索引
L.pop([index])                              # 删除并返回index处的元素，默认为删除并返回最后一个元素
L.remove(value)                             # 删除列表中的value值，只删除第一次出现的value的值
L.reverse()                                 # 反转列表
L.sort(cmp=None, key=None, reverse=False)   # 排序列表
a = [1, 2, 3], b = a[10:]                   # 注意，这里不会引发IndexError异常，只会返回一个空的列表[]
a = [], a += [1]                            # 这里实在原有列表的基础上进行操作，即列表的id没有改变
a = [], a = a + [1]                         # 这里最后的a要构建一个新的列表，即a的i
a = [1, 2, 3, 4, 5, 6, 7]
a[1:4] = []                                 # a = [1, 5, 6, 7]
a = [0, 1, 2, 3, 4, 5, 6, 7]
del a[::2]                                  # 去除偶数项(偶数索引的)，a = [1, 3, 5, 7]
a = a * 2                                   # a = [1, 3, 5, 7, 1, 3, 5, 7]
a = ([1, 2],)           # a[0][1] = 0, OK
a = [(1, 2)]            # a[0][1] = 0, Error
```

- 使用内置函数sorted()对列表进行排序并返回新列表 ，同 reversed()
- `sum([[1, 2], [3], [4]], [])    # [1, 2, 3, 4] 这个操作占用空间较大` 

## 字典

```python
D = {}
D = {'spam':2, 'tol':{'ham':1}}              # 嵌套字典
D = dict.fromkeys(['s', 'd'], 8)             # {'s': 8, 'd': 8}
D = dict(name = 'tom', age = 12)             # {'age': 12, 'name': 'tom'}
D = dict([('name', 'tom'), ('age', 12)])     # {'age': 12, 'name': 'tom'}
D = dict(zip(['name', 'age'], ['tom', 12]))  # {'age': 12, 'name': 'tom'}
D.keys(); D.values(); D.items()              # 字典键、值以及键值对
D.get(key, default)                          # get函数
D.update(D_other)                            # 合并字典，如果存在相同的键值，D_other的数据会覆盖掉D的数据
D.pop(key, [D])                              # 删除字典中键值为key的项，返回键值为key的值，如果不存在，返回默认值D，否则异常
D.popitem()                                  # pop字典中随机的一项（一个键值对）
D.setdefault(k[, d])                         # 设置D中某一项的默认值。如果k存在，则返回D[k]，否则设置D[k]=d，同时返回D[k]。
del D                                        # 删除字典
del D['key']                                 # 删除字典的某一项
if key in D:   if key not in D:              # 测试字典键是否存在
# 字典注意事项：（1）对新索引赋值会添加一项（2）字典键不一定非得是字符串，也可以为任何的不可变对象
# 不可变对象：调用对象自身的任意方法，也不会改变该对象自身的内容，这些方法会创建新的对象并返回。
# 字符串、整数、tuple都是不可变对象，dict、set、list都是可变对象
D[(1,2,3)] = 2                               # tuple作为字典的key
D = {k:8 for k in ['s', 'd']}                # {'s': 8, 'd': 8}
D = {k:v for (k, v) in zip(['name', 'age'], ['tom', 12])}  # {'age': 12, 'name': tom}
```

- collections模块的defaultdict
- collections模块的 `frequences = Counter(z)` `frequences.most_common(3)` 

## 集合

```python
set是一个无序不重复元素集, 基本功能包括关系测试和消除重复元素。
set支持union(联合), intersection(交), difference(差)和symmetric difference(对称差集)等数学运算。
set支持x in set, len(set), for x in set。
set不记录元素位置或者插入点, 因此不支持indexing, slicing, 或其它类序列的操作

s = set([3,5,9,10])          # 创建一个数值集合，返回{3, 5, 9, 10}
t = set("Hello")           # 创建一个字符的集合，返回{'l', 'H', 'e', 'o'}
a = t | s;    t.union(s)                     # t 和 s的并集
b = t & s;    t.intersection(s)              # t 和 s的交集
c = t – s;    t.difference(s)          # 求差集（项在t中, 但不在s中）
d = t ^ s;    t.symmetric_difference(s)      
# 对称差集（项在t或s中, 但不会同时出现在二者中）
t.add('x');   t.remove('H')                  # 增加/删除一个item
s.update([10,37,42])                         # 利用[......]更新s集合
x in s,  x not in s                          # 集合中是否存在某个值
s.issubset(t);      s <= t         # 测试是否 s 中的每一个元素都在 t 中
s.issuperset(t);    s >= t         # 测试是否 t 中的每一个元素都在 s 中 
s.copy(); 
s.discard(x);                                # 删除s中x
s.clear()                                    # 清空s
{x**2 for x in [1, 2, 3, 4]}   # 集合解析，结果：{16, 1, 4, 9}
{x for x in 'spam'}           # 集合解析，结果：{'a', 'p', 's', 'm'}
```

- n当不再使用某个集合时，可以使用del命令删除整个集合。
- 集合对象的pop()方法随机弹出并删除其中一个元素
- remove()方法直接删除指定元素，clear()方法清空集合