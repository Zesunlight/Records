数据类型：object、int64、float64、datetime64、bool

### Series

同时具有列表和字典 的属性，字典的属性由索引赋予。

```python
s = pd.Series([1,3,6,np.nan,44,1])
# s.index s.name s.values s.dtype
print([attr for attr in dir(s) if not attr.startswith('_')])

data = np.array(['a','b','c','d'])
s = pd.Series(data,index=[100,101,102,103]) 

# 如果 data 为 Series 或 dict ，那么其已经提供了 Series 需要的索引信息，所以 index 项是不需要提供
# 如果额外提供了 index 项，那么其将对当前构建的Series进行 重索引（增删）（等同于reindex操作）。
data2 = { 'a':1, 'b':2,'c':3 } 
index2 = ['a','b','d'] 
s = pd.Series(data = data2, index = index2) 
# index项用于从当前已有索引中匹配出相同的行，如果当前索引缺失给定的索引，则填充NaN

data = {'a' : 0., 'b' : 1., 'c' : 2.}
s = pd.Series(data)

s = pd.Series(data = [1,2,3,4,5],index = ['a','b','c','d','e'],name='ss')
# s[1] s[0:2] s[[0, 2]]
# s.loc['a'] s[['a','c','d']] s['f']
# []，快捷查看   .loc[]，基于索引    .iloc[]，基于位置 

s1 = s.copy()  # 深copy，拷贝数据结构包含的所有信息 
s1.loc['a':'c'] = [10,4,5]
s1.replace(to_replace = 10, value = 100, inplace=False)
s1.index = ['a','e','f']
s1.rename(index = {'e':'b'}, inplace = False)

s1.loc['d'] = 4 
s2 = pd.Series([22,33], index = ['a', 'g']) 
s1.append(s2, ignore_index=False)

s1.drop(['a','f'])
```

- `Series.replace(to_replace=None, value=None, inplace=False)` 改值

  to_replace：要修改的值，可以为列表； 

  value：改为的值，可以为列表，与to_repalce要匹配；

  inplace：是否在原地修改；

- ` Series.rename(index=None, level = None, inplace = False)` 改索引

  index：list or dict，list类型时必须和已有索引长度相同，dict类型可以部分修改； 

  level：多重索引时，可以指定修改哪一重，从0开始递增； 

  inplace：是否原地修改。

- `Series.append(to_append, ignore_index=False, verify_integrity=False)` 添加多行

  to_append: 另一个series或多个Series构成的列表； 

  ignore_index：False-保留原有索引，True-清除所有索引，生成默认数值索引； 

  verify_integrity：True的情况下，如果to_append索引与当前索引有重复，则报错。

- `Series.drop(labels, level=None, inplace=False) ` 删除多行

  labels：索引，单索引或索引的列表；

  level：多重索引需要设置； 

  inplace：是否本地修改

### DataFrame

#### data无行索引，无列索引

如果 data 为 ndarray(2D) or list(2D)，那么其缺少 DataFrame 需要的行、列索引信息； 

如果提供 index 或 columns 项，其必须和data的行 或 列长度相同； 

如果不提供 index 或 columns 项，那么其将默认生成数值索引range(0, data.shape[0])) 或 range(0, data.shape[1])。

#### data无行索引，有列索引

如果data为 dict of (ndarray(1D) or list(1D))，所有ndarray或list的长度必须相同。

dict的key为DataFrame提 供了需要的columns信息，缺失index； 

如果提供 index 项，必须和list的长度相同； 如果不提供 index，那么其将默认生成数值索引range(0, data.shape[0]))； 

如果还额外提供了columns项，那么其将对当前构建的DataFrame进行列重索引。

#### data有行索引，有列索引

如果data为 dict of (Series or dict)，那么其已经提供了DataFrame需要的所有信息；

如果多个Series或dict间的索引不一致，那么取并操作（pandas不会试图丢掉信息），缺失的数据填充 NaN； 

如果提供了index项或columns项，那么其将对当前构建的DataFrame进行 重索引（reindex，pandas内部调 用接口）。

```python
data = [1,2,3,4,5]
df = pd.DataFrame(data)
data = [[1,2,3], [4,5,6]] 
df = pd.DataFrame(data)
# df.index df.columns df.values df.dtypes

data2 = { 'A' : [1,4], 'B': [2,5], 'C':[3,6] } 
index2 = ['a','b'] 
columns2 = ['A','B','D'] 
df = pd.DataFrame(data=data2, index = index2, columns = columns2)

data3 = { 'A' : { 'a':1, 'b':4}, 'B': {'a':2,'b':5}, 'C':{'a':3, 'c':6} } 
df = pd.DataFrame(data=data3)

data = [['Alex',10],['Bob',12],['Clarke',13]]
df = pd.DataFrame(data,columns=['Name','Age'])
df = pd.DataFrame(data,columns=['Name','Age'], dtype=float)

data = {'Name':['Tom', 'Jack', 'Steve', 'Ricky'], 'Age':[28,34,29,42]}
df = pd.DataFrame(data, index=['rank1','rank2','rank3','rank4'])

data = [{'a': 1, 'b': 2},{'a': 5, 'b': 10, 'c': 20}]
df = pd.DataFrame(data)

data = [{'a': 1, 'b': 2},{'a': 5, 'b': 10, 'c': 20}]
df1 = pd.DataFrame(data, index=['first', 'second'], columns=['a', 'b'])
df2 = pd.DataFrame(data, index=['first', 'second'], columns=['a', 'b1'])

d = {'one' : pd.Series([1, 2, 3], index=['a', 'b', 'c']),
     'two' : pd.Series([1, 2, 3, 4], index=['a', 'b', 'c', 'd'])}
df = pd.DataFrame(d)
print(df['one'])  # 列操作，单列索引，返回Series
print(df[['one','two']]) # 列操作，列索引列表，返回DataFrame
print(df.loc['b'])   #行索引
print(df.loc['a':'b', 'one'])
print(df.iloc[2])  #整数位置 df.iloc[1,1] df.iloc[0:2,0] df.iloc[[0,1],[0,2]]
print(df[0:1])  # 行操作，位置范围，返回DataFrame
# df[0]  # 报错，0不是列名

# 查的基础上赋值进行修改，.loc[]方法确保在原地修改。
df.loc['a':'b', 'one'] = [10, 20]
df1.columns = ['E','F']  # 必须全改，不能切片修改
# df.replace({'Address':{'street_1':'one','street_2':'two'}}).head()

df['three']=pd.Series([10,20,30],index=['a','b','c'])
df['four']=df['one']+df['three']
del df['one']
df.pop('two')
df.drop(0)  # Drop rows with label 0

df = pd.DataFrame([[1, 2], [3, 4]], index = [1, 2], columns = ['a','b'])
df2 = pd.DataFrame([[5, 6], [7, 8]], index = [3, 4], columns = ['a','b'])
df = df.append(df2)

df = pd.DataFrame({'col1':list('abcde'),'col2':range(5,10),
                   'col3':[1.3,2.5,3.6,4.6,5.8]},index=list('一二三四五'))
df.rename(index={'一':'one'},columns={'col1':'new_col1'})
df.drop(index='五', columns='col1') # 设置inplace=True后会直接在原DataFrame中改动

df.loc[5] = [8,9]  # 增加一行
print(df)
df['c'] = [3,4,5,6,7]  # 增加一列
print(df)

df1 = pd.DataFrame([[22,33,44],[55,66,77]], index = [6,7],columns = ['a', 'b', 'c'])
pd.concat([df,df1], axis = 0)  # 增加一行，返回新的 DataFrame

df1 = pd.DataFrame([[22,33],[88]], index = [4,5],columns = ['d', 'e'])
pd.concat([df,df1], axis = 1)  # 增加一列，返回新的 DataFrame
```

- `DataFrame.rename(index=None, columns = None,  level = None, inplace = False)` 改索引

  index：list or dict，list类型时必须长度相同，dict类型时可以部分修改； 

  columns：list or dict，list时必须长度相同，dict时可以部分修改； 

  level：多重索引时，可以指定修改哪一重，目前还用不着； 

  inplace：是否原地修改

- `pd.concat(objs, axis=0) ` 增加多行，axis=1为增加多列；objs: list of DataFrame

- `DataFrame.drop(labels, axis = 0,  level=None, inplace=False) ` 删除

  labels：索引，单索引或索引的列表； 

  axis：0，删行；

  level：多重索引需要指定； 

  inplace：是否本地修改。

### 文件

#### .csv文件

`pd.read_csv(filepath_or_buffer, sep=',', header='infer', names=None,index_col=None, encoding=None )` 

filepath_or_buffer：路径和文件名不要带中文，带中文容易报错。 

sep: csv文件数据的分隔符，默认是','，根据实际情况修改； 

header：如果有列名，那么这一项不用改，如果没有列名，那么必须设置header = None； 

names：names为需要传入的列名列表，不设置默认生成数值索引；

index_col：list of (int or name)，传入列名的列表或者列名的位置，选取这几列作为索引； 

encoding：根据你的文档编码来确定，如果有中文读取报错，试试encoding = 'gbk'。

```python
df.to_csv('data/new_table.csv')
#df.to_csv('data/new_table.csv', index=False) #保存时除去行索引
```

#### .excel文件

`pd.read_excel(io, sheetname=0, header=0, index_col=None, names=None)` #需要安装xlrd包

header：如果有列名，那么这一项不用改，如果没有列名，那么必须设置header = None； 

names：names为列名的列表，不设置默认生成数值索引； 

index_col：同上。

```python
#需要安装openpyxl
df.to_excel('data/new_table2.xlsx', sheet_name='Sheet1')
```

#### .txt文件

```python
pd.read_table('data/table.txt') #可设置sep分隔符参数
```

