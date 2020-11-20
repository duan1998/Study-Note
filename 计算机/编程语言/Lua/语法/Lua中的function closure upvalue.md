# Lua中的function closure upvalue

### 名词解释

closure 闭包

upvalue(external local variable) 外部局部变量

first-class value/citizens 一阶类型值（一阶公民），比如function可以作为参数传给其他function，也可在其他function内定义

### 联系

Lua中function作为**firist-class value**，可以在function内部**嵌套定义**，比如在f1内定义了f2，那么f1是f2的**enclosing**(外包)函数，f2是f1的**inner**(内嵌)函数，而**内嵌函数**可以访问**外包函数的所有局部变量**，并这些变量被称为该内嵌函数的**外部局部变量**

### 示例1

##### 代码

```lua
function f1(n)
	local function f2()
		print(n)
	end
	return f2
end
g1=f1(1979)     --type(g1)==function  此时g1就是拥有着f1(1979)所有的局部变量的状态的f2函数，其中局部变量n=1979，那么执行g1的话，会输出1979
g2=f1(500)      --type(g2)==function  此时g2就是拥有着f1(500)所有的局部变量的状态的f2函数，其中局部变量n=500，那么执行g2的话，会输出500
g1()
g2()
--[[
Output
1979
500
]]
```

##### 注解

编译时，Lua编译一个函数时，会生成一个对应的原型(prototype)，包含了一些信息

运行时，每当Lua执行一个形如function...end，他就会**创建一个新的数据对象**，其中包含**原型的引用**，**环境的引用**以及一个**由所有upvalue引用组成的数组**，这个数据对象称为**闭包**，按照示例，g1和g2的值是闭包，是两个不相同的闭包，每个**闭包**可以**保有自己的upvalue值**。

### 示例2

##### 代码

```lua
function create(n)
	lcoal function fool()
		print(n)
	end
	local function foo2()
		n=n+10
	end
end
f1,f2=create(1979)
f1()
f2()
f1()
--[[
Output
1979
1989
1989
]]
```

##### 注解

这里要说明的点是，当Lua发现两个闭包的upvalue指向的是当前**堆栈上的相同变量**时，会生成一个**公用的拷贝**，**共享**

### 示例3

##### 代码

```lua
function Test(n)
	local function foo()
		local function inner1()
			print(n)
		end
		local function inner2()
			n=n+10
		end
		
		return inner1,inner2
	end
	return foo
end

t=Test(1979)
f1,f2=t()
f1()
f2()
f1()
g1,g2=t()
g1()
--[[
Outout
1979
1989
1989
]]
```

##### 注解

这里要说明的点是t=Test(1979)时，t作为一个闭包，已经保存了upvalue中的**n**的值，然后f1,f2=t()时，这两个闭包会去find他们的upvalue引用，t作为他们的“**父闭包**”，其upvalue是被**共享**的，所以，后面执行f2之后，g1去执行时，n对应的upvalue值已经被f2更新过了。

