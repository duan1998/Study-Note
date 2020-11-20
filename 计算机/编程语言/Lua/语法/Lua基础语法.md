# luaLua基础语法

### 注释

单行 

```lua
--
```

多行

```lua
--[[
 多行注释
 多行注释
 --]]
```

### 数据类型

##### 描述

- nil	           表示无效值，**条件表达式里意为false**
- boolean     false/true
- number     **双精度类型实浮点数** ，**表达式里0意为true**
- string         双引号或者单引号表示
- function    **由C或lua编写的函数**
- userdate   **表示任意存储在变量中C数据结构**
- thread       用于执行协同程序
- table          关联数组，数组索引可以是**number,string,table**类型，构造方式通过**构造表达式**，空表**{}**

##### 示例

```lua
print(type(2))        --number
print(type(2.2))      --number
print(type(false))    --boolean
str1="this is string"
str2='this is string'
html=[[
<html>
<head></head>
<body>
	<a href="http://www.runoob.com">笔记</a>
</body>
</html>
]]

--table
tab= { key1 = "val1", key2 = "val2", "val3" }

```

### 变量

##### 类型

全局变量，局部变量，表中的域

Lua中的变量如果不加local标记，均默认为全局变量

##### 默认值

默认值均为nil

##### 赋值语句

Lua可以同时对多个变量赋值，以'，'符号隔开，如果等号右边存在表达式，会先计算所有表达式，再进行赋值

##### 索引

table索引使用[]，也提供'.'操作

```lua
t[i]
t.i                 -- 当索引为字符串类型时的一种简化写法
```

### 循环

```lua
--while循环
while(condition)
do
   statements
end

--数值for循环   var：exp1->exp2，var+=exp3，[exp3] defaut=1，exp1和exp2以及exp3都是**一次性求值**，结果用在之后的**每次循环**中
for var=exp1,exp2,exp3 do  
    <执行体>  
end  

--泛型for循环   通过迭代器函数遍历所有值  ipairs是lua内置的迭代器函数，用来**迭代数组**
a = {"one", "two", "three"}
for i, v in ipairs(a) do
    print(i, v)
end 

--repeat ... until
repeat
   statements
until( condition )



```

### 分支

```lua
-- if
if(布尔表达式)
then
   --[ 在布尔表达式为 true 时执行的语句 --]
end

-- if elseif else
if( 布尔表达式 1)
then
   --[ 在布尔表达式 1 为 true 时执行该语句块 --]

elseif( 布尔表达式 2)
then
   --[ 在布尔表达式 2 为 true 时执行该语句块 --]

elseif( 布尔表达式 3)
then
   --[ 在布尔表达式 3 为 true 时执行该语句块 --]
else 
   --[ 如果以上布尔表达式都不为 true 则执行该语句块 --]
end

```

### 函数

##### 正常函数

```lua
--[[ 函数返回两个值的最大值 --]]
function max(num1, num2)

   if (num1 > num2) then
      result = num1;
   else
      result = num2;
   end
   return result;
end
```

##### 多值返回

```lua
s, e = string.find("www.runoob.com", "runoob") 
```

##### 函数作为实参

```lua
function add(num1,num2,functionPrint)
   result = num1 + num2
   -- 调用传递的函数参数
   functionPrint(result)
end
```

##### 可变参数

```lua
-- ...表示可变参数   固定参数必须放在变长参数之前
function add(...)  
local s = 0  
  for i, v in ipairs{...} do   --> {...} 表示一个由所有变长参数构成的数组  
    s = s + v  
  end  
  count=select("#",...)  --使用select("#",...)获取可变参数的数量   select(n,...)返回第n个可变实参
  return s  
end  
print(add(3,4,5,6,7))  --->25
```

### 运算符

##### 类C(不等于：~=)

```
--算数运算符
+ - * / % ^ - 
--关系运算符
== ~= > < >= <=
--逻辑运算符
and or not
```

##### 独有

**..**        连接两个字符串

\#        返回字符串或者表的长度

### 字符串

##### 内置函数

- **string.upper(argument)**  (字符串转大写)

- **string.lower(argument)**（字符串转小写）

- **string.gsub(mainString,findString,replaceString,[num])**（在字符串中替换：目标字符串，被替换的字符，要替换的字符，替换的次数(默认全部替换)）

- **string.find (str, substr, [init, [end]])**（指定的目标字符串搜索指定的内容，返回其具体位置，不存在返回nil）

- **string.reverse(arg)**

- **string.format(...)**（返回一个类似printf的格式化字符串）

- ```lua
  > string.format("the value is:%d",4)
  ```

- **string.char(arg)**  （char 将整型数字转成字符并连接）

- ```lua
  string.char(97,98,99,100)
  abcd
  ```

- **string.byte(arg[,int])**（ 转换字符为整数值(可以指定某个字符，默认第一个字符)）

- ```lua
  string.byte("ABCD",4)
  68
  ```

- **string.len(arg)**

- **string.rep(string, n)**（返回字符串string的n个拷贝，repeat）

- **string.gmatch(str, pattern)** 回一个迭代器函数，每一次调用这个函数，返回一个在字符串 str 找到的下一个符合 pattern 描述的子串。如果参数 pattern 描述的字符串没有找到，迭代函数返回nil。

- ```lua
  for word in string.gmatch("Hello Lua user", "%a+") do print(word) end
  Hello
  Lua
  user
  ```

- **string.match(str, pattern, init)**
  string.match()只寻找源字串str中的第一个配对. 参数init可选, 指定搜寻过程的起点, 默认为1。
  在成功配对时, 函数将返回配对表达式中的所有捕获结果; 如果没有设置捕获标记, 则返回整个配对字符串. 当没有成功的配对时, 返回nil。

- ```lua
  string.match("I have 2 questions for you.", "%d+ %a+")
  2 questions
  
  string.format("%d, %q", string.match("I have 2 questions for you.", "(%d+) (%a+)"))
  2, "questions"
  ```

- **string.sub(s, i [, j])**    j默认为 -1，最后一个字符

### 数组

##### 特点

大小非固定

##### 索引

整数，可为负数

##### 多维数组

```lua
-- 初始化数组
array = {}
for i=1,3 do
   array[i] = {}
      for j=1,3 do
         array[i][j] = i*j
      end
end

-- 访问数组
for i=1,3 do
   for j=1,3 do
      print(array[i][j])
   end
end
```

### 迭代器

##### 描述

可以遍历一种集合所有元素的机制，使用函数实现

##### 迭代器函数

有状态的迭代器<状态使用闭包保存>

考虑到遍历“集合”中的元素，需要**保存**一些信息，比如当前枚举index，以及枚举次数count，这里考虑使用Lua提供的闭包`closure`机制进行保存

##### 函数示例

```lua
function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end
```

##### 泛型for

###### 语法

```lua
for <var-list> in <exp-list> do  --<var-list>是一个或多个变量名的列表如k,v  <exp-list>是一个或多个表达式的列表
     <body>  
end
```

###### 说明

for做的第一件事就是对in后面的表达式求值，这些表达式应该返回3个值供for保存：**迭代器函数**、**恒定状态**和**控制变量**的初值

如果表达式返回的结果个数不足三个会自动用nil补足，多出部分被忽略

如果返回的第一个值为nil循环结束

### Table

##### 常用方法

table.concat (table [,` sep` [, `start` [, `end`]]])

> table.concat()函数列出参数中指定table的数组部分从start位置到end位置的所有元素, 元素间以指定的分隔符(sep)隔开

table.insert (table, [`pos`,] `value`)

> 在table的数组部分指定位置(pos)插入值为value的一个元素. pos参数可选, 默认为数组部分末尾.

table.remove (table [, `pos`])

> 返回table数组部分位于pos位置的元素. 其后的元素会被前移. pos参数可选, 默认为table长度, 即从最后一个元素删起。

table.sort (table [, `comp`])

> 对给定的table进行升序排序。



