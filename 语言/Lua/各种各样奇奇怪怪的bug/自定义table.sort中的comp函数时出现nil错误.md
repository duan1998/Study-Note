# 自定义table.sort中的comp函数时出现nil错误

### 说明

因为table.sort是采用快速排序的算法，在实现排序时没有做边界检查

### 方法

```lua
local function compare(a, b)
    --1. a,b不允许为空
    if not a or not b then
        return false
    end

    --2. a==b，排序实现中，两者相等，要永远返回false
    --至于为什么要返回false，可以看一下坑点2
    --交换的话就会导致不稳定
    if a == b then
        return false
    end
    --升序
    return a < b
end
```

