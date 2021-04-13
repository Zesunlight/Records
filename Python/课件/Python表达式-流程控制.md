# 运算符

- 关系运算符：>、<、==、<=、>=、!=，可以连续使用

- 逻辑运算符：and、or、not，注意短路求值

- ```python
  #共享引用和相等测试：
  L = [1], M = [1], L is M            # 返回False
  L = M = [1, 2, 3], L is M           # 返回True，共享引用
  #增强赋值和共享引用：普通+号会生成新的对象，而增强赋值+=会在原处修改
  L = M = [1, 2]
  L = L + [3, 4]                    # L = [1, 2, 3, 4], M = [1, 2]
  L += [3, 4]                 # L = [1, 2, 3, 4], M = [1, 2, 3, 4]
  ```

# 流程控制

## 选择

- `x = math.sqrt(9) if 4>3 else math.sqrt(-1)` 惰性求值

- ```python
  def func(score):
  	if score > 100:
  		return 'wrong score.must <= 100.'
  	elif score >= 90:
  		return 'A'
      elif score >= 80:
  		return 'B'
      elif score >= 70:
  		return 'C'
      elif score >= 60:
  		return 'D'
      elif score >= 0:
  		return 'E'
      else:
  		return 'wrong score.must >0'
  
  def func(score):
  	degree = 'DCBAAE'
  	if score > 100 or score < 0:
          return 'wrong score.must between 0 and 100.'
      else:
          index = (score - 60)//10
          if index >= 0:
              return degree[index]
          else:
  		     return degree[-1]
  
  def daysBetween(year1, month1, day1,
                  year2, month2, day2):
      from datetime import date
      dif = date(year1, month1, day1)
      dif = dif - date(year2, month2, day2)
      return dif.days
  ```

- `calendar.isleap(2016)` 

## 循环

- 水仙花数

  ```python
  for i in range(100, 1000):
      #这里是序列解包的用法
      bai, shi, ge = map(int, str(i))
      if ge**3 + shi**3 + bai**3 == i:
          print(i)
  
  for num in range(100, 1000):
      r = map(lambda x:int(x)**3, str(num))
      if sum(r) == num:
          print(num)
  ```

- 打印乘法表

  ```python
  for i in range(1,10):
      for j in range(1,i+1):
          print(f'{i}*{j}={j*i}', end=' ')
      print()
  ```

- 鸡兔同笼问题。假设共有鸡、兔30只，脚90只，求鸡、兔各有多少只

  ```python
  for chicken in range(0, 31):
      if 2*chicken + (30-chicken)*4 == 90:
          print('chicken:', chicken, ' rabbit:', 30-chicken)
  ```

- ```python
  def fib(n):
      a, b = 0, 1
      while a < n:
          print(a, end=' ')
          a, b = b, a+b
      print()
  ```

- 

