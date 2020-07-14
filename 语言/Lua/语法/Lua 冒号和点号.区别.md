# Lua 冒号`:`和点号`.`区别

### 代码示例

```lua
Class = {}
Class.__index = Class

function Class.new(x,y)
    local cls = {}
    setmetatable(cls, Class)
    cls.x = x
    cls.y = y
    return cls
end
function Class:test()
-- 等价于
-- function Class.test(self)
    print(self.x,self.y)
end


object = Class.new(10,20)

object:test()
-- 等价于
object.test(object)
```

### 总结

定义的时候，Class:test()与 Class.test(self)是等价的

调用的时候：object:test() 与object.test(object)等价的

`.`号可以看成调用静态方法，而`:`号可以看成是成员方法