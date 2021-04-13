## Scipy

### 简介

Scipy是著名的Python开源科学计算库，建立在Numpy之上。它增加的功能包括数值积分、最优化、统计和一些专用函数。 

SciPy函数库在NumPy库的基础上增加了众多的数学、科学以及工程计算中常用的库函数，是一个工具箱。它的子模块对应于不同的应用，比如插值、积分、优化、图像处理、统计等。

https://www.scipy.org/

### 安装

`pip install scipy` 

### 主要模块

#### 集群：cluster

聚类算法在信息理论、目标检测、通信、压缩等领域有着广泛的应用。

SciPy库通过集群包提供了K-Means算法实现，是一种在一组未标记数据中查找聚类和聚类中心的方法。

`from scipy.cluster.vq import kmeans` `help(kmeans)` 

给定一组初始的K中心，K-means算法迭代以下两个步骤

- 对于每个中心，识别比其更靠近它的训练点子集（其簇）比任何其他中心。
- 计算每个聚类中数据点的每个特征的平均值，并且该平均向量成为该聚类的新中心。

#### SciPy常量(constants)包

```python
import scipy.constants
import math

print("sciPy - pi = {:.16f}".format(scipy.constants.pi))
print("math - pi = {:.16f}".format(math.pi))
# pi golden c speed_of_light G degree e(基本电荷量)
print(scipy.constants.find())
```

#### 快速傅立叶变换：scipy.fftpack

傅里叶分析将信号从原始域（通常是时间或空间）转换到频域的表示或者逆过来转换。

```python
from scipy import fftpack

time_step = 0.02
period = 5.
time_vec = np.arange(0, 20, time_step)
# 有噪音的信号输入
sig = np.sin(2 * np.pi / period * time_vec) + 0.5 * np.random.randn(time_vec.size)

sample_freq = fftpack.fftfreq(sig.size, d=time_step)  # 生成采样频率
sig_fft = fftpack.fft(sig)  # 计算快速傅里叶变换
pidxs = np.where(sample_freq > 0)
freqs = sample_freq[pidxs]
power = np.abs(sig_fft)[pidxs]
freq = freqs[power.argmax()]  # 寻找信号频率
sig_fft[np.abs(sample_freq) > freq] = 0   # 高频噪音将从傅立叶转换过的信号移除
main_sig = fftpack.ifft(sig_fft)

plt.figure()
plt.plot(time_vec, sig)
plt.plot(time_vec, main_sig, linewidth=3)
plt.xlabel('Time [s]')
plt.ylabel('Amplitude')
```

#### 数值积分：scipy.integrate

```python
from scipy.integrate import quad
from numpy import exp
from math import sqrt

res, err = quad(np.sin, 0, np.pi/2)  # 一重积分
np.allclose(res, 1)

def f(x, a, b):
    return a * (x ** 2) + b
ret = quad(f, 0, 1, args=(3, 1))  # 一重积分

f = lambda x, y : 19*x*y
g = lambda x : 0
h = lambda y : sqrt(1-4*y**2)
res, err = scipy.integrate.dblquad(f, 0, 0.5, g, h)  # 二重积分
```

#### 插值：scipy.interpolate

从实验数据中拟合函数，评估没有测量过的点

```python
measured_time = np.linspace(0, 1, 10)
noise = (np.random.random(10)*2 - 1) * 1e-1
measures = np.sin(2 * np.pi * measured_time) + noise  # 接近sin函数的实验数据

from scipy.interpolate import interp1d
linear_interp = interp1d(measured_time, measures)  # 建立一个线性插值函数
computed_time = np.linspace(0, 1, 50)  # 实例需要评估感兴趣的时间点
linear_results = linear_interp(computed_time)

cubic_interp = interp1d(measured_time, measures, kind='cubic')  # 可选的参数kind也可以选择进行立方插值
cubic_results = cubic_interp(computed_time)
```

#### 文件输入/输出：scipy.io

```python
# 载入和保存matlab文件
from scipy import io as spio
a = np.ones((3, 3))
spio.savemat('file.mat', {'a': a}) # savemat expects a dictionary
data = spio.loadmat('file.mat', struct_as_record=True)
print(spio.whosmat('file.mat'))  # 不读取数据到内存的情况下检查MATLAB文件的内容
print(data['a'])
```

#### 线性代数操作：scipy.linalg

```python
from scipy import linalg
arr = np.array([[1, 2], [3, 4]])
darr = linalg.det(arr)  # 行列式
iarr = linalg.inv(arr)  # 逆矩阵
np.allclose(np.dot(arr, iarr), np.eye(2))  # True

A = np.array([[3,4],[7,8]])
l, v = linalg.eig(A)  # l为特征值，v为特征向量

arr = np.arange(9).reshape((3, 3)) + np.diag([1, 0, 1])
uarr, spec, vharr = linalg.svd(arr)  # 奇异值分解 SVD
sarr = np.diag(spec)
svd_mat = uarr.dot(sarr).dot(vharr)
np.allclose(svd_mat, arr)  # True
```

$$
x+3y+5z=10 \\
  2x+5y+z=8 \\
  2x+3y+8z=3
$$

```python
a = np.array([[1, 3, 5], [2, 5, 1], [2, 3, 8]])
b = np.array([10, 8, 3])
x = linalg.solve(a, b)  # 求解
```

#### 图像处理：scipy.ndimage

专用于图像处理，ndimage意味着n维图像

```python
from scipy import misc, ndimage  # SciPy中的misc package带有一些图像
f = misc.face()
rotate_face = ndimage.rotate(f, 45)
plt.imshow(rotate_face)

face = misc.face(gray = True)
lx, ly = face.shape
print(face.mean(), face.max(), face.min())
crop_face = face[lx/4: - lx/4, ly/4: - ly/4]
flip_ud_face = np.flipud(face)
```

```python
import scipy.ndimage as nd
import numpy as np
import matplotlib.pyplot as plt
im = np.zeros((256, 256))
im[64:-64, 64:-64] = 1
im[90:-90, 90:-90] = 2
plt.imshow(im)
im = nd.gaussian_filter(im, 8)  # 过滤是一种用于修改或增强图像的技术。 例如，可以过滤图像以强调某些功能或删除其他功能。通过过滤实现的图像处理操作包括平滑，锐化和边缘增强。高斯滤波可用于降低图像中的噪声
plt.imshow(im)
sx = nd.sobel(im, axis = 0, mode = 'constant')  # 边缘检测
sy = nd.sobel(im, axis = 1, mode = 'constant')
plt.imshow(sx)
plt.imshow(sy)
plt.imshow(np.hypot(sx, sy))
plt.show()
```

#### ODR Orthogonal Distance Regression 正交距离回归

最小二乘法，旨在最小化每个点的平方误差之和。

用于回归研究。 基本线性回归通常用于通过最佳拟合线来估计两个变量y和x之间的关系

```python
from scipy.odr import *
# Initiate some data, giving some randomness using random.random().
x = np.arange(20)
y = 3 * x + 1 + np.random.randn(x.size) * 0.1
# Define a function (quadratic in our case) to fit the data with.
def linear_func(p, x):
    m, c = p
    return m*x + c
# Create a model for fitting.
linear_model = Model(linear_func)
# Create a RealData object using our initiated data from above.
data = RealData(x, y)
# Set up ODR with the model and data.
odr = ODR(data, linear_model, beta0=[0., 1.])
# Run the regression.
out = odr.run()
# Use the in-built pprint method to give us results.
out.pprint()
```

#### 优化及拟合：scipy.optimize

提供了函数最小化（标量或多维度）、曲线拟合和求根的有用算法。

```python
def f(x):
    return x**2 + 10*np.sin(x)

x = np.arange(-10, 10, 0.1)
plt.plot(x, f(x))
plt.show()
```

##### 寻找标量函数的最小值

```python
from scipy import optimize
# 第一个参数是函数名，第二个参数是梯度下降的起点。返回值是函数最小值的x值(ndarray数组)
optimize.fmin_bfgs(f, 0)  # array([-1.30644003])
# 算法可能找到这些局部最低点而不是全局最低点，这取决于初始点
optimize.fmin_bfgs(f, 3, disp=0)  # array([ 3.83746663])

# 要找到全局最优点，最简单的算法是暴力算法，算法中会评估给定网格内的每一个点
grid = (-10, 10, 0.1)
xmin_global = optimize.brute(f, (grid,))
xmin_global  # array([-1.30641113])
xmin = xmin_global[0] # x值
ymin = f(xmin) # y值，即函数最小值

# 画出最小值的点, s=20设置点的大小，c='r'设置点的颜色
plt.scatter(xmin, ymin, s=20, c='r')
plt.show()

# 要找出局部最低点，让我们用scipy.optimize.fminbound将变量限制在(0,10)区间
xmin_local = optimize.fminbound(f, 0, 10)    
xmin_local  # 3.8374671194983834
```

```python
def g(x):
    return x**2 + 20*np.sin(x)

# 求取最小值，初始值为7
ret = optimize.basinhopping(g, 7)
print(ret['x'])
optimize.fmin_bfgs(g, 3, disp=0)
```

##### 寻找标量函数的根

```python
root = optimize.fsolve(f, 1)  # 我们的最初猜想是1
root2 = optimize.fsolve(f, -2.5)
```

##### 曲线拟合

```python
xdata = np.linspace(-10, 10, num=20)
ydata = f(xdata) + np.random.normal(xdata.size)

def f2(x, a, b):
    return a*x**2 + b*np.sin(x)
    
guess = [2, 2]
params, params_covariance = optimize.curve_fit(f2, xdata, ydata, guess)  # 可拟合任意曲线
params  # array([  0.99719019,  10.27381534])
```

```python
X = np.linspace(-10, 10, num=20)
Y = X * 3 + 2 + np.random.randn(X.size) * 0.1

# 偏差函数, 计算以p为参数的直线和原始数据之间的误差
def residuals(p):
     k, b = p
     return Y-(k*X+b)

# leastsq()使得residuals()的输出数组的平方和最小，参数的初始值为[1, 0]
ret = optimize.leastsq(residuals, [1, 10])
k, b = ret[0]
print("k = ", k, "b = ", b)
```

##### 求解非线性方程组

```python
from scipy.optimize import fsolve
from math import sin,cos

def f(x):
    x0 = float(x[0])
    x1 = float(x[1])
    x2 = float(x[2])
    return [
        4*x1 + 9,
        3*x0*x0 - sin(x1*x2),
        x1*x2 - 2.5
    ]
result = fsolve(f, [1,1,1])
print(result)
```

$$
4x+9=0 \\
3y^2–sin(yz)=0 \\
yz–2.5=0
$$

#### 信号处理：scipy.signal

```python
t = np.linspace(0, 5, 100)
x = np.sin(t)
from scipy import signal
x_resampled = signal.resample(x, 25)  # 使用FFT将信号重采样成n个点

import matplotlib.pyplot as plt
plt.plot(t, x)
plt.plot(t[::4], x_resampled, 'ko')
plt.show()
```

```python
t = np.linspace(0, 5, 100)
x = t + np.random.normal(size=100)

from scipy import signal
x_detrended = signal.detrend(x)  # 从信号中去除线性趋势

plt.plot(t, x) 
plt.plot(t, x_detrended) 
```

#### 稀疏矩阵：scipy.sparse

零元素数目远远多于非零元素数目

```python
from scipy import sparse
x = sparse.eye(5)         # 5行5列单位矩阵
x2 = sparse.identity(3)
x.data                    # 查看非0元素
x.toarray()               # 返回数组形式
x.sin()                   # 支持正弦、余弦等运算
x.mean()                  # 平均值
```

#### 空间(Spatial)

```python
# Delaunay三角剖分是三角测量DT(P) ，使得DT(P)中没有点在D(TP)中的任何三角形的外接圆内。
from scipy.spatial import Delaunay
points = np.array([[0, 4], [2, 1.1], [1, 3], [1, 2]])
tri = Delaunay(points)
import matplotlib.pyplot as plt
plt.triplot(points[:,0], points[:,1], tri.simplices.copy())
plt.plot(points[:,0], points[:,1], 'o')
plt.show()

# 欧几里得平面的凸壳
from scipy.spatial import ConvexHull
points = np.random.rand(10, 2) # 30 random points in 2-D
hull = ConvexHull(points)
plt.plot(points[:,0], points[:,1], 'o')
for simplex in hull.simplices:
	plt.plot(points[simplex,0], points[simplex,1], 'k-')
plt.show()
```

#### 特殊函数：scipy.special

https://docs.scipy.org/doc/scipy/reference/special.html#scipy.special

```python
comb(N, k[, exact, repetition])  The number of combinations of N things taken k at a time.
perm(N, k[, exact])  Permutations of N things taken k at a time, i.e., k-permutations of N.
cbrt(x)  Element-wise cube root of x.
exp10(x)  Compute 10**x element-wise.
exp2(x)  Compute 2**x element-wise.
radian(d, m, s[, out])  Convert from degrees to radians.
cosdg(x[, out])  Cosine of the angle x given in degrees.
sindg(x[, out])
tandg(x[, out])
cotdg(x[, out])

from scipy.special import cosdg, cbrt
print(cosdg(60))
print(cbrt(np.arange(20)))
```

#### 统计和随机数：scipy.stats

包含了统计工具以及概率分析工具

##### PDF（Probability Density Function） 

随机变量的概率密度函数。产生对应x的这种分布的y值。

##### CDF（Cumulative Distribution Function）

累积分布函数，又叫分布函数，是概率密度函数的积分，能完整描述一个实随机变量X的概率分布。
$$
{\displaystyle F_{X}(x)=\operatorname {P} (X\leq x)}
$$

##### PPF (Percent Point Function) 

百分点函数，累积分布函数的反函数，q=0.01时，ppf就是p(X<x)=0.01时的x值。

```python
X = norm.rvs(loc=1.0, scale=2.0, size=10000)  # 产生服从这种分布的一个样本，对随机变量进行随机取值，可以通过size参数指定输出的数组大小
Y = norm.rvs(size=10000)  # 标准正态分布
# 可以使用fit()方法对随机取样序列x进行拟合，返回的是与随机取样值最吻合的随机变量的参数,均值和标准差
print(stats.norm.fit(X))  # 得到随机序列的期望值和标准差
# (1.0017857642988532, 1.9730569004868777)
print(stats.norm.fit(Y))  # 得到随机序列的期望值和标准差
# (0.0060040024384516713, 1.0038393637253209)
```

```python
from scipy import stats
from scipy.stats import norm

from scipy.stats import uniform
print(uniform.cdf([0, 1, 2, 3, 4, 5], loc = 0, scale = 4))

X = norm()  # 默认参数，loc=0，scale=1
Y = norm(loc=1.0, scale=2.0)  # 平移1.0，缩小2.0
Z = norm(loc=-1.0, scale=0.5)  # 平移1.0，缩小2.0

t = np.arange(-10, 10, 0.01)
plt.plot(t, X.pdf(t), label="$X$", color="red")
plt.plot(t, Y.pdf(t), "b--", label="$Y$")
plt.plot(t, Z.pdf(t), label="$Z$", color="yellow")
plt.legend()

plt.plot(t, X.pdf(t), color="red")
plt.plot(t, X.cdf(t), "b--")
plt.plot(t, X.ppf(t), color="black")

print(Y.mean(), Y.std(), Y.var())  # 期望,方差,标准差
print(Y.stats())  # mean, variance
```

### 随机变量

```python
from scipy.stats import chi2                 # 卡方分布
from scipy.stats import norm                 # 正态分布
from scipy.stats import t                    # t分布
from scipy.stats import f                    # F分布
```

