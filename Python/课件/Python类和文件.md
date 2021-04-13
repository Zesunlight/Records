# 类

## 面向对象

- 面向过程的程序设计把计算机程序视为一系列的命令集合，即一组函数的顺序执行。为了简化程序设计，面向过程把函数继续切分为子函数，即把大块函数通过切割成小块函数来降低系统的复杂度。

- 面向对象的程序设计把计算机程序视为一组对象的集合，而每个对象都可以接收其他对象发过来的消息，并处理这些消息，计算机程序的执行就是一系列消息在各个对象之间传递。

- 假设我们要处理学生的成绩表，为了表示一个学生的成绩，面向过程的程序可以用一个dict表示：

  ```
  std1 = { 'name': 'Michael', 'score': 98 }
  std2 = { 'name': 'Bob', 'score': 81 }
  ```

  而处理学生成绩可以通过函数实现，比如打印学生的成绩：

  ```
  def print_score(std):
      print('%s: %s' % (std['name'], std['score']))
  ```

  如果采用面向对象的程序设计思想，我们首选思考的不是程序的执行流程，而是`Student`这种数据类型应该被视为一个对象，这个对象拥有`name`和`score`这两个属性（Property）。如果要打印一个学生的成绩，首先必须创建出这个学生对应的对象，然后，给对象发一个`print_score`消息，让对象自己把自己的数据打印出来。

  ```
  class Student(object):
  
      def __init__(self, name, score):
          self.name = name
          self.score = score
  
      def print_score(self):
          print('%s: %s' % (self.name, self.score))
  ```

  给对象发消息实际上就是调用对象对应的关联函数，我们称之为对象的方法（Method）。面向对象的程序写出来就像这样：

  ```
  bart = Student('Bart Simpson', 59)
  lisa = Student('Lisa Simpson', 87)
  bart.print_score()
  lisa.print_score()
  ```

  面向对象的设计思想是从自然界中来的，因为在自然界中，类（Class）和实例（Instance）的概念是很自然的。Class是一种抽象概念，比如我们定义的Class——Student，是指学生这个概念，而实例（Instance）则是一个个具体的Student，比如，Bart Simpson和Lisa Simpson是两个具体的Student。

  所以，面向对象的设计思想是抽象出Class，根据Class创建Instance。

  面向对象的抽象程度又比函数要高，因为一个Class既包含数据，又包含操作数据的方法。

  ### 继承

  比如，我们已经编写了一个名为`Animal`的class，有一个`run()`方法可以直接打印：

  ```
  class Animal(object):
      def run(self):
          print('Animal is running...')
  ```

  当我们需要编写`Dog`和`Cat`类时，就可以直接从`Animal`类继承：

  ```
  class Dog(Animal):
      pass
  
  class Cat(Animal):
      pass
  ```

### 成员函数

```python
class Root:
    __total = 0
    def __init__(self, v):    #构造方法
        self.__value = v
        Root.__total += 1

    def show(self):           #普通实例方法
        print('self.__value:', self.__value)
        print('Root.__total:', Root.__total)

    @classmethod              #修饰器，声明类方法
    def classShowTotal(cls):  #类方法
        print(cls.__total)

    @staticmethod             #修饰器，声明静态方法
    def staticShowTotal():    #静态方法
        print(Root.__total)

>>> r = Root(3)
>>> r.classShowTotal()              #通过对象来调用类方法
1
>>> r.staticShowTotal()             #通过对象来调用静态方法
1
>>> r.show()
self.__value: 3
Root.__total: 1
>>> rr = Root(5)
>>> Root.classShowTotal()           #通过类名调用类方法
2
>>> Root.staticShowTotal()          #通过类名调用静态方法
2
```

- Python中类的构造函数是\__init__()，一般用来为数据成员设置初值或进行其他必要的初始化工作，在创建对象时被自动调用和执行。

# 文件

- **文本文件**：文本文件存储的是常规字符串，由若干文本行组成，通常每行以换行符'\n'结尾。**常规字符串**是指记事本或其他文本编辑器能正常显示、编辑并且人类能够直接阅读和理解的字符串，如英文字母、汉字、数字字符串。文本文件可以使用字处理软件如gedit、记事本进行编辑。

- **二进制文件**：二进制文件把对象内容以**字节串**(bytes)进行存储，无法用记事本或其他普通字处理软件直接进行编辑，通常也无法被人类直接阅读和理解，需要使用专门的软件进行解码后读取、显示、修改或执行。常见的如图形图像文件、音视频文件、可执行文件、资源文件、各种数据库文件、各类office文档等都属于二进制文件。

```python
#-- 文件基本操作
output = open(r'C:\spam', 'w')          # 打开输出文件，用于写
input = open('data', 'r')               # 打开输入文件，用于读。打开的方式可以为'w', 'r', 'a', 'wb', 'rb', 'ab'等
fp.read([size])                         # size为读取的长度，以byte为单位
fp.readline([size])                     # 读一行，如果定义了size，有可能返回的只是一行的一部分
fp.readlines([size])                    # 把文件每一行作为一个list的一个成员，并返回这个list。其实它的内部是通过循环调用readline()来实现的。如果提供size参数，size是表示读取内容的总长。
fp.readable()                           # 是否可读
fp.write(str)                           # 把str写到文件中，write()并不会在str后加上一个换行符
fp.writelines(seq)                      # 把seq的内容全部写到文件中(多行一次性写入)
fp.writeable()                          # 是否可写
fp.close()                              # 关闭文件。
fp.flush()                              # 把缓冲区的内容写入硬盘
fp.fileno()                             # 返回一个长整型的”文件标签“
fp.isatty()                             # 文件是否是一个终端设备文件（unix系统中的）
fp.tell()                               # 返回文件操作标记的当前位置，以文件的开头为原点
fp.next()                               # 返回下一行，并将文件操作标记位移到下一行。把一个file用于for … in file这样的语句时，就是调用next()函数来实现遍历的。
fp.seek(offset[,whence])                # 将文件打开操作标记移到offset的位置。whence为0表示从头开始计算，1表示以当前位置为原点计算。2表示以文件末尾为原点进行计算。
fp.seekable()                           # 是否可以seek
fp.truncate([size])                     # 把文件裁成规定的大小，默认的是裁到当前文件操作标记的位置。
for line in open('data'): 
	print(line)                         # 使用for语句，比较适用于打开比较大的文件
with open('data') as file:
	print(file.readline())              # 使用with语句，可以保证文件关闭
with open('data') as file:
	lines = file.readlines()            # 一次读入文件所有行，并关闭文件
open('f.txt', encoding = 'latin-1')     # Python3.x Unicode文本文件
open('f.bin', 'rb')                     # Python3.x 二进制bytes文件
# 文件对象还有相应的属性：buffer closed encoding errors line_buffering name newlines等
```

```python
with open('sample.txt') as fp:      #假设文件采用CP936编码
    for line in fp:                 #文件对象可以直接迭代
        print(line)
```

