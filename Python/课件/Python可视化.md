```python
from matplotlib import pylab
import matplotlib.pyplot as plt

pylab.mpl.rcParams['font.sans-serif'] = ['SimHei'] # Matplotlib 默认情况不支持中文
plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
# plt.rcParams['font.sans-serif']=['Arial Unicode MS']
plt.rcParams['axes.unicode_minus']=False #用来正常显示负号
#有中文出现的情况，需要u'内容'
# plt.savefig()一定放在plt.show()之前
```

#### 子图

```python
x = np.arange(1, 100)
plt.figure(figsize=(10,6), dpi=80)
#作图1
plt.subplot(221)  
plt.plot(x, x)  
#作图2
plt.subplot(222)  
plt.plot(x, -x)  
 #作图3
plt.subplot(223)  
plt.plot(x, x ** 2)  
plt.grid(color='r', linestyle='--', linewidth=1,alpha=0.3)
#作图4
plt.subplot(224)  
plt.plot(x, np.log(x))  
plt.show()
```

#### 散点图

```python
%matplotlib inline
plt(x, sin(x), 'b-o', x, sin(2 * x), 'r-^')

plt.figure(figsize=(9,6))
N = 1000
x = np.random.randn(N)
y = np.random.randn(N)
T = np.arctan2(x,y)
plt.scatter(x, y, c=T, s=25, alpha=0.4, marker='>')
plt.show()
```

#### 柱状图

```python
x_index = np.arange(5)   #柱的索引
y_data = (20, 35, 30, 35, 27)
bar_width = 0.35   #定义一个数字代表每个独立柱的宽度
# 参数：左偏移、高度、柱宽、透明度、颜色、图例
plt.bar(x_index, y_data, width=bar_width, alpha=0.6, color='b',label='data')
plt.legend() #显示图例
plt.tight_layout()  #自动控制图像外部边缘
plt.show()

name_list = ['Monday','Tuesday','Friday','Sunday']
num_list = [1.5,0.6,7.8,6]
plt.bar(range(len(num_list)), num_list,color=list('rgb'),tick_label=name_list)
plt.bar(range(len(num_list)), num_list,color='black',tick_label=name_list, bottom=num_list) # 堆叠
plt.barh(range(len(num_list)), num_list,tick_label = name_list)  # 条形图又称横向柱形图

label_list = ['2014', '2015', '2016', '2017']    # 横坐标刻度显示值
num_list1 = [20, 30, 15, 35]      # 纵坐标值1
num_list2 = [15, 30, 40, 20]      # 纵坐标值2
x = range(len(num_list1))
rects1 = plt.bar(x=x, height=num_list1, width=0.4, alpha=0.8, color='red', label="一部门")
rects2 = plt.bar(x=[i + 0.4 for i in x], height=num_list2, width=0.4, color='green', label="二部门")
plt.ylim(0, 50)     # y轴取值范围
plt.xticks([index + 0.2 for index in x], label_list)
plt.ylabel("数量")
plt.xlabel("年份")
```

#### 直方图

```python
fig,(ax0,ax1) = plt.subplots(nrows=2,figsize=(9,6))
sigma = 1   #标准差
mean = 0    #均值
x=np.random.normal(mean,sigma,1000)   #正态分布随机数
# histtype直方图类型，color颜色，alpha透明度
ax0.hist(x,bins=40,histtype='bar',color='yellowgreen',alpha=0.75,rwidth=0.8)
# histtype直方图类型，color颜色，alpha透明度
ax1.hist(x,bins=20,histtype='bar',color='pink',alpha=0.75,cumulative=True,rwidth=0.8)
plt.show()

plt.figure(figsize=(9,6))
x=np.random.normal(mean,sigma,1000)   #正态分布随机数
plt.subplot(211)
plt.hist(x,bins=10,histtype='bar',color='yellowgreen',alpha=0.75,rwidth=1)
plt.subplot(212)
plt.hist(x,bins=30,histtype='bar',facecolor='pink',alpha=0.75,cumulative=True,rwidth=0.8)
plt.show()
```

`plt.hist(x, bins=None, range=None, density=None, weights=None, cumulative=False, bottom=None, histtype='bar', align='mid', orientation='vertical', rwidth=None, log=False, color=None, label=None, stacked=False, normed=None)`

- x：指定要绘制直方图的数据；输入值，这需要一个数组或者一个序列，不需要长度相同的数组。
- bins：指定直方图条形的个数；
- range：指定直方图数据的上下界，默认包含绘图数据的最大值和最小值；
- density：布尔,可选。如果"True"，返回元组的第一个元素将会将计数标准化以形成一个概率密度，也就是说，直方图下的面积（或积分）总和为1。这是通过将计数除以数字的数量来实现的观察乘以箱子的宽度而不是除以总数数量的观察。如果叠加也是“真实”的，那么柱状图被规范化为1。(替代normed)
- weights：该参数可为每一个数据点设置权重；
- cumulative：是否需要计算累计频数或频率；
- bottom：可以为直方图的每个条形添加基准线，默认为0；
- histtype：指定直方图的类型，默认为bar，除此还有’barstacked’, ‘step’, ‘stepfilled’；
- align：设置条形边界值的对其方式，默认为mid，除此还有’left’和’right’；
- orientation：设置直方图的摆放方向，默认为垂直方向；horizontal
- rwidth：设置直方图条形宽度的百分比；
- color：设置直方图的填充色；
- label：设置直方图的标签，可通过legend展示其图例；
- alpha：透明度，浮点数。

#### 饼图

`pie(x, explode, labels, colors，**kwargs)`

- x：标量序列，必须参数，其中元素决定饼图中楔块的大小。
- explode：数组，可选参数，无默认值，如果不是 None，则为长度为 len(x) 数组，该数组指定用于偏移每个楔块的半径分数。
- labels：列表，可选参数，无默认值，为每个楔块提供标签的字符串序列。
- colors：数组，可选参数，无默认值，为饼图循环所用的颜色参数序列。如果没有，将使用当前活动周期中的颜色。
- autopct：字符串或函数，可选参数，无默认值，如果不是 None，则是用于用数值标记楔块的字符串或函数。标签将放在楔块内部；如果是格式字符串，则标签为 fmt%pct；如果是函数，则调用它`autopct='%1.1f%%'` 
- pctdistance：浮点型，可选参数，默认值：0.6，每个饼图楔块的中心与参数 autoct 生成的文本的开始之间的比率，设置圆内文本距圆心距离。如果 autoct 为 None，则忽略。
- shadow：布尔型，可选参数，默认值：False，在馅饼下面画一个阴影。
- radius：浮点型，可选参数，无默认值，饼图的半径，如果“半径”为None，则将设置为1。
- startangle：起始角度，默认从0开始逆时针转
- labeldistance:设置标签文本距圆心位置，1.1表示1.1倍半径

```python
labels = 'Frogs', 'Hogs', 'Dogs', 'Logs'
sizes = [15, 30, 45, 10]
explode = (0, 0.1, 0, 0)  # only "explode" the 2nd slice (i.e. 'Hogs')

plt.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%',
        shadow=True, startangle=90)
plt.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
plt.legend()

colors = cm.rainbow(np.arange(4)/4)
colors = cm.rainbow(np.linspace(0, 1, 5))  # 生成RGBA形式的颜色
# 在r,g,b三个通道（channel）的基础上增加了一个透明权重的通道alpha

name = [chr(i) for i in range(ord('a'), ord('h'))]
value = np.random.randint(1, 10, len(name))
c = cm.rainbow(np.linspace(0, 1, len(name)))
ex = [0] * len(name)
ex[3] = 0.1
plt.pie(value, explode=ex, colors=c, labels=name, labeldistance=1.1, autopct="%1.1f%%", shadow=False, startangle=90, pctdistance=0.6)
plt.axis("equal")
plt.legend()
```

#### 从零开始

```python
import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline

x = np.linspace(-np.pi, np.pi)
c, s = np.cos(x), np.sin(x)

f = plt.figure(figsize=(10,6), dpi=80) # 设置图像大小
# 画图，指定颜色，线宽，类型
plt.plot(x, c, color="blue", linewidth=2.5, linestyle="-")
plt.plot(x, s, color="red",  linewidth=2.5, linestyle="-")
# plt.plot(x, c, 'b-', x, s, 'r-', linewidth=2.5)
plt.style.use('classic')

plt.tick_params(axis='x', color='r') # x y both, 设置 tick, 标签的小短线
# 设置显示范围
plt.xlim(x.min() * 1.1, x.max() * 1.1)
plt.ylim(c.min() * 1.1, c.max() * 1.1)
# 设置刻度
plt.xticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi])
plt.yticks([-1, 0, 1])
plt.xticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi], 
               ['$-\pi$', '$-\pi/2$', '$0$', '$\pi/2$', '$\pi$'], 
               fontsize ='xx-large')
plt.yticks([-1, 0, 1], 
               ['$-1$', '$0$', '$+1$'], fontsize ='xx-large')

plt.xticks([-np.pi, -np.pi/2, 0, np.pi/2, np.pi], 
           ['$-\pi$', '$-\pi/2$', '$0$', '$\pi/2$', '$\pi$'],
           fontsize = 'x-large')
plt.yticks([-1, -0.5, 0, 0.5, 1],
           ['$-1$', '$-1/2$', '$0$', '$1/2$', '$1$'], 
           fontsize = 'x-large')

# 加入图例，frameon表示去掉图例周围的边框
plt.legend(['cosine', 'sine'], loc='upper left', frameon=False)

# 数据点
t = 2 * np.pi / 3
# 蓝色虚线
plt.plot([t,t],[0,np.cos(t)], color ='blue', linewidth=2.5, linestyle="--")
# 该点处的 cos 值
plt.scatter([t,],[np.cos(t),], 50, color ='blue')
# 在对应的点显示文本
plt.annotate(r'$\sin(\frac{2\pi}{3})=\frac{\sqrt{3}}{2}$', # 文本
     xy=(t, np.sin(t)), # 数据点坐标位置
     xycoords='data',   # 坐标相对于数据
     xytext=(+10, +30), # 文本位置坐标
     textcoords='offset points', # 坐标相对于数据点的坐标
     fontsize=16,       # 文本大小
     arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=.2")) # 箭头
# 红色虚线
plt.plot([t,t],[0,np.sin(t)], color ='red', linewidth=2.5, linestyle="--")
# 该点处的 sin 值
plt.scatter([t,],[np.sin(t),], 50, color ='red')
# 显示文本
plt.annotate(r'$\cos(\frac{2\pi}{3})=-\frac{1}{2}$',
         xy=(t, np.cos(t)), xycoords='data',
         xytext=(-90, -50), textcoords='offset points', fontsize=16,
         arrowprops=dict(arrowstyle="->", connectionstyle="arc3,rad=.2"))

t = 2 * np.pi / 3
plt.plot([t, t], [np.sin(t), np.cos(t)], '--k')
plt.scatter([t, t], [np.sin(t), np.cos(t)], color = 'green')
plt.annotate(r'$\sin(\frac{2\pi}{3})=\frac{\sqrt{3}}{2}$', 
             xy = (t, np.sin(t)), 
             xytext = (5, 10), 
             textcoords = 'offset points',
             fontsize = 15)
plt.annotate(r'$\cos(\frac{2\pi}{3})=-\frac{1}{2}$', 
             xy = (t, np.cos(t)), 
             xytext = (-110, -10), 
             textcoords = 'offset points', 
             fontsize = 15)
```

##### `figure()` 函数的主要参数

|        参数 |             默认值 |                         描述 |
| ----------: | -----------------: | ---------------------------: |
|       `num` |                `1` |                         图号 |
|   `figsize` |   `figure.figsize` | 图大小（宽，高）（单位英寸） |
|       `dpi` |       `figure.dpi` | 分辨率（每英寸所打印的点数） |
| `facecolor` | `figure.facecolor` |                     背景颜色 |
| `edgecolor` | `figure.edgecolor` |                     边界颜色 |
|   `frameon` |             `True` |               是否显示图框架 |

```python
for name in matplotlib.colors.cnames.items():
    print(name)

from matplotlib import font_manager as fm
proptease = fm.FontProperties()
proptease.set_size('xx-small')
# font size include: ‘xx-small’,x-small’,'small’,'medium’,‘large’,‘x-large’,‘xx-large’ or number, e.g. '12'
plt.setp(autotexts, fontproperties=proptease)
plt.setp(texts, fontproperties=proptease)
```

