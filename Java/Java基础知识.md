## 集合

### Collection

- `int size()`; `boolean isEmpty()`; `boolean contains(Object obj)`; `boolean remove(Object obj)` 
- `boolean add(Object element)` 如果由于这个调用改变了集合，返回 `true` 
- `Object[] toArray()`; `<T> T[] toArray(T[] arrayToFill)` 

#### [List](https://snailclimb.gitee.io/javaguide/#/docs/java/collection/Java集合框架常见面试题?id=_1131-list)

- `Arraylist`： `Object[]`数组
- `Vector`：`Object[]`数组
- `LinkedList`： 双向链表(JDK1.6 之前为循环链表，JDK1.7 取消了循环)

#### [Set](https://snailclimb.gitee.io/javaguide/#/docs/java/collection/Java集合框架常见面试题?id=_1132-set)

- `HashSet`（无序）: 基于 `HashMap` 实现的，线程不安全的，可以存储 null 值
- `LinkedHashSet`（有序）：`LinkedHashSet` 是 `HashSet` 的子类，通过 `LinkedHashMap` 来实现的
- `TreeSet`（有序）： 红黑树(自平衡的排序二叉树)

#### [Map](https://snailclimb.gitee.io/javaguide/#/docs/java/collection/Java集合框架常见面试题?id=_1133-map)

- `HashMap`： JDK1.8 之前 HashMap 由数组+链表组成的，数组是 HashMap 的主体，链表则是主要为了解决哈希冲突而存在的（“拉链法”解决冲突）。JDK1.8 以后在解决哈希冲突时有了较大的变化，当链表长度大于阈值（默认为 8）（将链表转换成红黑树前会判断，如果当前数组的长度小于 64，那么会选择先进行数组扩容，而不是转换为红黑树）时，将链表转化为红黑树，以减少搜索时间
- `LinkedHashMap`： `LinkedHashMap` 继承自 `HashMap`，所以它的底层仍然是基于拉链式散列结构即由数组和链表或红黑树组成。另外，`LinkedHashMap` 在上面结构的基础上，增加了一条双向链表，使得上面的结构可以保持键值对的插入顺序。同时通过对链表进行相应的操作，实现了访问顺序相关逻辑。
- `Hashtable`： 是线程安全的
- `TreeMap`： 红黑树（自平衡的排序二叉树）


#### List - Array - ArrayList - LinkedList - Vector

##### List 与 ArrayList

- List 是一个接口，而 ArrayList 是 List 接口的一个实现类

- `List list = new ArrayList();` 

  这句创建了一个 ArrayList 实现类的对象，后把它上溯到了 List 接口，实现了泛型。此时它就是一个 List 对象了，它不能使用 ArrayList 类具有的但是 List 接口没有的属性和方法。 

- `ArrayList list = new ArrayList();` 创建的对象则保留了 ArrayList 的所有属性和方法

- 如果我们创建的是抽象类的对象引用，那么这个对象只能调用自己的非抽象方法，不能调用继承它的子类的独有的方法

- 接口的扩展性好

##### Array 与 ArrayList

- ArrayList 可自动扩容，Array 大小固定
- Array 数组在存放的时候一定是同种类型的元素；ArrayList 不一定
- ArrayList 提供了更多的方法和特性，但效率低
- 不指定数据类型时，ArrayList 会把所有插入其中的数据都当作为object类型来处理，在使用的时候，需要将它们转化为对应的原类型来处理，这就存在了装箱与拆箱的操作，会带来很大的性能损耗。

##### ArrayList、LinkedList、Vector

- ArrayList 和 Vector 是基于数组实现的，LinkedList 是基于双向链表实现的
- ArrayList 和 LinkedList 是线程不安全的，Vector 是线程安全的
- ArrayList 扩容后的容量是之前的1.5倍，Vector 默认情况下扩容后的容量是之前的2倍

### Collections 工具类

https://gitee.com/SnailClimb/JavaGuide/blob/master/docs/java/basic/Arrays,CollectionsCommonMethods.md

```java
void reverse(List list)//反转
void shuffle(List list)//随机排序
void sort(List list)//按自然排序的升序排序
void sort(List list, Comparator c)//定制排序，由Comparator控制排序逻辑
void swap(List list, int i , int j)//交换两个索引位置的元素
void rotate(List list, int distance)//旋转。当distance为正数时，将list后distance个元素整体移到前面。当distance为负数时，将 list的前distance个元素整体移到后面

int binarySearch(List list, Object key)//对List进行二分查找，返回索引，注意List必须是有序的
int max(Collection coll)//根据元素的自然顺序，返回最大的元素。 类比int min(Collection coll)
int max(Collection coll, Comparator c)//根据定制排序，返回最大元素，排序规则由Comparatator类控制。类比int min(Collection coll, Comparator c)
void fill(List list, Object obj)//用指定的元素代替指定list中的所有元素。
int frequency(Collection c, Object o)//统计元素出现次数
int indexOfSubList(List list, List target)//统计target在list中第一次出现的索引，找不到则返回-1，类比int lastIndexOfSubList(List source, list target).
boolean replaceAll(List list, Object oldVal, Object newVal)// 用新元素替换旧元素
```

### 其他

- 使用自然排序，需要实现 Comparable 接口，并且在内部重写 comparaTo 方法；而 Comparator 则是在外部制定排序规则，然后作为排序策略参数传递给某些类
- HashMap 的长度是 2 的幂次方。对数组的长度取模运算，得到的余数用做存放的位置，也就是对应的数组下标。这个数组下标的计算方法是 `(n - 1) & hash`（n 代表数组长度）。
- `Arrays.asList()`传入的对象必须是对象数组，而不是基本类型
- 由于JVM优化，`new String[0]`作为`Collection.toArray()`方法的参数现在使用更好

## 多线程

### [简述线程、程序、进程的基本概念](https://snailclimb.gitee.io/javaguide/#/docs/java/Java基础知识?id=_331-简述线程、程序、进程的基本概念。以及他们之间关系是什么)

- **线程**与进程相似，但线程是一个比进程更小的执行单位。一个进程在其执行的过程中可以产生多个线程。与进程不同的是同类的多个线程共享同一块内存空间和一组系统资源，所以系统在产生一个线程，或是在各个线程之间作切换工作时，负担要比进程小得多，也正因为如此，线程也被称为轻量级进程。
- **程序**是含有指令和数据的文件，被存储在磁盘或其他的数据存储设备中，也就是说程序是静态的代码。
- **进程**是程序的一次执行过程，是系统运行程序的基本单位，因此进程是动态的。系统运行一个程序即是一个进程从创建，运行到消亡的过程。简单来说，一个进程就是一个执行中的程序，它在计算机中一个指令接着一个指令地执行着，同时，每个进程还占有某些系统资源如 CPU 时间，内存空间，文件，输入输出设备的使用权等等。换句话说，当程序在执行时，将会被操作系统载入内存中。 
- 线程是进程划分成的更小的运行单位。线程和进程最大的不同在于基本上各进程是独立的，而各线程则不一定，因为同一进程中的线程极有可能会相互影响。从另一角度来说，进程属于操作系统的范畴，主要是同一段时间内，可以同时执行一个以上的程序，而线程则是在同一程序内几乎同时执行一个以上的程序段。

#### Java线程的状态

![](md-pic/Java线程的状态.png)

### 线程池

- 线程池内部维护了若干个线程，没有任务的时候，这些线程都处于等待状态。
- 如果有新任务，就分配一个空闲线程执行。如果所有线程都处于忙碌状态，新任务要么放入队列等待，要么增加一个新线程进行处理。
- 通过 `ThreadPoolExecutor` 的构造函数来创建线程池，然后提交任务给线程池执行就可以了
- JDK 提供的并发容器大部分在 `java.util.concurrent` 包中

#### 优点

- **降低资源消耗**。通过重复利用已创建的线程降低线程创建和销毁造成的消耗。
- **提高响应速度**。当任务到达时，任务可以不需要的等到线程创建就能立即执行。
- **提高线程的可管理性**。线程是稀缺资源，如果无限制的创建，不仅会消耗系统资源，还会降低系统的稳定性，使用线程池可以进行统一的分配，调优和监控。

#### Java多线程的实现

- 继承Thread类，Override它的run方法；
- 实现Runnable接口，实现run方法；
- 实现Callable接口，线程结束后可以有返回值或抛出异常，但是该方式是依赖于线程池的。

### 一些相关方法

#### execute()方法和submit()

- execute()方法用于提交不需要返回值的任务，所以无法判断任务是否被线程池执行成功与否；
- submit()方法用于提交需要返回值的任务

#### sleep() 方法和 wait() 方法

- sleep 方法没有释放锁，而 wait 方法释放了锁
- 两者都可以暂停线程的执行。
- Wait 通常被用于线程间交互/通信，sleep 通常被用于暂停执行。
- wait() 方法被调用后，线程不会自动苏醒，需要别的线程调用同一个对象上的 notify() 或者 notifyAll() 方法。sleep() 方法执行完成后，线程会自动苏醒。或者可以使用 wait(long timeout)超时后线程会自动苏醒。

#### start() 方法、run() 方法

- new 一个 Thread，线程进入了新建状态
- 调用 start() 方法，会启动一个线程并使线程进入了就绪状态，当分配到时间片后就可以开始运行了
- start() 会执行线程的相应准备工作，然后自动执行 run() 方法的内容，这是真正的多线程工作
- 直接执行 run() 方法，会把 run 方法当成一个 main 线程下的普通方法去执行，并不会在某个线程中执行它，所以这并不是多线程工作。

**调用 start 方法方可启动线程并使线程进入就绪状态，而 run 方法只是 thread 的一个普通方法调用，还是在主线程里执行。**

### [悲观锁与乐观锁](https://snailclimb.gitee.io/javaguide/#/docs/essential-content-for-interview/面试必备之乐观锁与悲观锁?id=何谓悲观锁与乐观锁)

#### [悲观锁](https://snailclimb.gitee.io/javaguide/#/docs/essential-content-for-interview/面试必备之乐观锁与悲观锁?id=悲观锁)

- 总是假设最坏的情况，每次去拿数据的时候都认为别人会修改，所以每次在拿数据的时候都会上锁
- 别人想拿这个数据就会阻塞直到它拿到锁（**共享资源每次只给一个线程使用，其它线程阻塞，用完后再把资源转让给其它线程**）
- 传统的关系型数据库里边就用到了很多这种锁机制，比如行锁，表锁等，读锁，写锁等，都是在做操作之前先上锁
- Java中`synchronized`和`ReentrantLock`等独占锁就是悲观锁思想的实现

#### [乐观锁](https://snailclimb.gitee.io/javaguide/#/docs/essential-content-for-interview/面试必备之乐观锁与悲观锁?id=乐观锁)

- 总是假设最好的情况，每次去拿数据的时候都认为别人不会修改，所以不会上锁
- 在更新的时候会判断一下在此期间别人有没有去更新这个数据，可以使用版本号机制和CAS算法实现
- **乐观锁适用于多读的应用类型，这样可以提高吞吐量**，像数据库提供的类似于**write_condition机制**，其实都是提供的乐观锁
- 在Java中`java.util.concurrent.atomic`包下面的原子变量类就是使用了乐观锁的一种实现方式**CAS**实现的

##### 版本号机制

在数据表中加上一个数据版本号version字段，表示数据被修改的次数，当数据被修改时，version值会加一。当线程A要更新数据值时，在读取数据的同时也会读取version值，在提交更新时，若刚才读取到的version值为当前数据库中的version值相等时才更新，否则驳回

##### CAS算法

compare and swap，无锁算法

## [反射](https://blog.csdn.net/sinat_38259539/article/details/71799078)

- JAVA反射机制是在运行状态中，对于任意一个类，都能够知道这个类的所有属性和方法；对于任意一个对象，都能够调用它的任意一个方法和属性；这种动态获取的信息以及动态调用对象的方法的功能称为java语言的反射机制。

- 把java类中的各种成分映射成一个个的Java对象

- 获取Class对象的三种方式

  ```java
  Student stu1 = new Student();//这一new 产生一个Student对象，一个Class对象。
  Class stuClass = stu1.getClass();//获取Class对象
  Class stuClass2 = Student.class;//第二种方式获取Class对象
  try {
  	Class stuClass3 = Class.forName("fanshe.Student");//第三种方式获取Class对象
  	//注意此字符串必须是真实路径，就是带包名的类路径，包名.类名
  } catch (ClassNotFoundException e) {
      e.printStackTrace();
  }
  ```

## 注解

注解是一种机制，用于将元标签与程序元素相关联，并允许编译器或虚拟机从这些注解元素中提取程序行为，并在必要时生成相互依赖的代码

### 内置注解

- @Deprecated  给类、方法、变量打上不建议使用的标签
- @Override  标识这个方法重写父类的方法
- @SuppressWarnings  在方法上使用，用于抑制警告
- @SafeVarargs   抑制参数类型安全检查警告
- @FunctionalInterface  用于编译级错误检查，当你写的接口不符合函数式接口定义的时候，编译器会报错

### 元注解

- @Retention  指定注解的生命周期，即存活时间。 在使用时，必须使用下面中的一个值
  - RetentionPolicy.SOURCE  注解只在源码阶段保留，在编译器进行编译生成class文件时丢弃，无法通过反射获取注解信息。
  - RetentionPolicy.CLASS 注解只被保留到编译进行的时候，它并不会被加载到JVM中，无法通过反射获取注解信息，这是默认值。
  - RetentionPolicy.RUNTIME 注解可以保留到程序运行的时候，它会被加载进入到 JVM 中，程序运行时可以通过反射获取到它们
- @Documented  javadoc命令生成的文档中体现注解的内容
- @Target  指定注解可用于哪些元素，例如类、方法、变量等
    - ElementType.ANNOTATION_TYPE 用于描述注解类型 
    - ElementType.CONSTRUCTOR 用于注解构造方法 
    - ElementType.FIELD 用于变量注解 
    - ElementType.LOCAL_VARIABLE 用于局部变量注解 
    - ElementType.METHOD 用于方法注解 
    - ElementType.PACKAGE 用于包注解 
    - ElementType.PARAMETER 用于方法内的参数注解 
- ElementType.TYPE 用于类、接口、枚举注解
- @Inherited  指定了注解可被继承
- @Repeatable  可重复使用的注解

## JVM

JVM直接和操作系统进行交互，与硬件不直接交互，操作系统可以帮我们完成和硬件进行交互的工作

### 5个部分

![](md-pic/JVM五部分.png)

#### 类加载器

如果 **JVM** 想要执行这个 **.class** 文件，我们需要将其装进一个 **类加载器** 中，它就像一个搬运工一样，会把所有的 **.class** 文件全部搬进JVM里面来。

#### 方法区

- 用于存放类似于元数据信息方面的数据的，比如类信息，常量，静态变量，编译后代码···等
- 类加载器将 .class 文件搬过来就是先丢到这一块上

#### 堆

**堆** 主要放了一些存储的数据，比如对象实例，数组···等，它和方法区都同属于 **线程共享区域** 。也就是说它们都是 **线程不安全** 的

#### 栈

**栈** 这是我们的代码运行空间。我们编写的每一个方法都会放到 **栈** 里面运行

#### 程序计数器

- 主要就是完成一个加载工作，类似于一个指针一样的，指向下一行我们需要执行的代码。
- 和栈一样，都是 **线程独享** 的，就是说每一个线程都会有自己对应的一块区域而不会存在并发和多线程的问题

虚拟机主要的5大块：方法区，堆都为线程共享区域，有线程安全问题，栈和本地方法栈和计数器都是独享区域，不存在线程安全问题，而 JVM 的调优主要就是围绕堆，栈两大块进行

### 垃圾回收

- Java 的自动内存管理主要是针对对象内存的回收和对象内存的分配
- Java 自动内存管理最核心的功能是 **堆** 内存中对象的分配与回收

### Lambda 表达式

`( parameter-list ) -> { expression-or-statements }` 

- `()` 中的 `parameter-list` 是以逗号分隔的参数；
- `->` 相当于 Lambda 的标识符；
- `{}` 中的 `expression-or-statements` 为 Lambda 的主体，可以是一行语句，也可以多行，可包含 `return` 语句

