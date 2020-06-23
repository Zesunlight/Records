> [Python网络爬虫与信息提取](http://www.icourse163.org/course/BIT-1001870001)
> [嵩天](http://www.icourse163.org/u/songtian425)

# Python - 网络爬虫规则

## Requests库

### requests库的方法

`requests.request(method, url, **kwargs)` 

- `method` : 请求方式，对应7种方法
- `url` : 拟获取页面的链接
- `**kwargs`: 控制访问的参数，共13个，为可选项

  params : 字典或字节序列，作为参数增加到url中
  data : 字典、字节序列或文件对象，作为Request的内容
  json : JSON格式的数据，作为Request的内容
  headers : 字典，HTTP定制头
  cookies : 字典或CookieJar，Request中的cookie
  auth : 元组，支持HTTP认证功能
  files : 字典类型，传输文件
  timeout : 设定超时时间，秒为单位
  proxies : 字典类型，设定访问代理服务器，可以增加登录认证
  allow_redirects : True/False，默认为True，重定向开关
  stream : True/False，默认为True，获取内容立即下载开关
  verify : True/False，默认为True，认证SSL证书开关
  cert : 本地SSL证书路径

图

### requests.get()

request对象和response对象

图

#### response对象的属性

图

图

### requests库的异常

图

#### 爬取网页的代码框架

```python
def getHTMLText(url):
    try:
        r = requests.get(url, timeout = 30)
        r.raise_for_status() #if status_code is not 200, trigger HTTPError
        r.endcoding = r.apparent_encoding
        return r.text
    except:
        return 'error'
```

## HTTP协议

Hypertext Transfer Protocol，超文本传输协议

- HTTP是一个基于“请求与响应”模式的、无状态的应用层协议
- HTTP协议采用URL作为定位网络资源的标识，URL格式如下：

  - `http://host[:port][path]`
  - host: 合法的Internet主机域名或IP地址
  - port: 端口号，缺省端口为80
  - path: 请求资源的路径
- URL是通过HTTP协议存取资源的Internet路径，一个URL对应一个数据资源

### 对资源的操作

图

通过URL和命令管理资源，操作独立无状态，网络通道及服务器成为了黑盒子

## Robots协议

Robots Exclusion Standard，网络爬虫排除标准

- 网站告知网络爬虫哪些页面可以抓取，哪些不行

- 在网站根目录下的robots.txt文件

  *代表所有，/代表根目录

- Robots协议是建议但非约束性，网络爬虫可以不遵守，但存在法律风险

- 类人行为可不参考Robots协议，网站是为人来服务的

## 应用提示

- 模拟浏览器访问

  `user_agent = {'user_agent':'Mozilla/5.0'}` 
  `r = requests.get(url, headers = user_agent)` 

- 百度的搜索引擎关键词提交接口：`http://www.baidu.com/s?wd=keyword` 

  `keyword = ('wd':'python')` 
  `r = requests.get('http://www.baidu,com/s', params = keyword)` 

- 网络图片链接的格式：`http://www.example.com/picture.jpg` 

  ```python
  r = requests.get(url)
  with open(path, 'wb') as f:
  	f.write(r.content)
  	f.close()
  ```

