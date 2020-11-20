# Lua 设置函数的环境

### 前言

可以把lua最初的全局环境看成一个table，lua使用全局变量`_G`来引用这个全局环境。

### 示例

```lua
a=1
local env={a=10,print=_G.print}
function f1()
	local _ENV=env --lua5.2之后使用该方式使用_ENV去设置该函数的环境
	print("in f1:a=",a)
end
function f2()
	print("in f2:a=",a)
end

--setfenv(f1,env) lua 5.2之前的版本使用该方法设置函数的环境
f1() --10
f2() --1



```

### 说明

本来f1，f2都是在最初的全局环境下的，他们获取的`a`也是全局环境下的`a`，但是在把f1的环境设置为表`env`后，f1获取的变量将从新的环境中获取，如果获取不到，则为nil