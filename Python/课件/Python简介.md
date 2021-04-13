# Python 简介

## **Python** 对比

C语言是可以用来编写操作系统的贴近硬件的语言，C语言适合开发那些追求运行速度、充分发挥硬件性能的程序，Python是更适合编写应用程序的高级编程语言。

https://hellogithub.com/report/tiobe/   https://www.tiobe.com/tiobe-index/  

代码不能加密。如果要发布你的Python程序，实际上就是发布源代码，这一点跟C语言不同，C语言不用发布源代码，只需要把编译后的机器码（也就是你在Windows上常见的xxx.exe文件）发布出去。要从机器码反推出C代码是不可能的，所以，凡是编译型的语言，都没有这个问题，而解释型的语言，则必须把源码发布出去。

Python是一门跨平台、开源、免费的**解释型高级动态编程语言** 

## Python 应用

django

Python标准库包含了多个调用操作系统功能的库。Python编写的系统管理脚本在可读性、性能、代码重用度、扩展性几方面都优于普通的shell脚本。

即可以利用游戏引擎的高性能，又可以受益于脚本化开发的优点，需要灵活修改和调整的部分可以写在脚本中，只需要修改脚本内容就可以调整游戏内容，不需要重新编译游戏

Requests、Scrapy、PySpider、Beautiful Soup

Pytorch、Keras、Tensorflow

## Python 环境

### windows

Python 3.X 在设计的时候没有考虑向下相容  2.7  2020-01-01 官方停止维护

https://www.python.org/downloads/  

控制面板\系统和安全\系统\高级系统设置\环境变量\Path  C:\Users\WDAGUtilityAccount\AppData\Local\Programs\Python\Python37\

###  Linux

sudo apt-get update 

sudo apt-get upgrade

##  Python 之禅

在 **Python** 解释器下输入

```
import this
```

这首诗反映了**Python**的设计哲学——**Python**是一种追求优雅，明确，简单的编程语言



# 参考

- https://gto76.github.io/python-cheatsheet/
- https://www.liaoxuefeng.com/wiki/1016959663602400
- http://localhost:8003/live.html#mode=edit  npm start