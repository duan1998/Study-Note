# Lua pairs和ipairs

### 相同点

都可以遍历集合（表，数组）



### 不同点

##### ipairs

- 从key=1开始遍历，没有找到key=1就停止遍历，且如果1->2->...如果出现断层，则停止遍历

```lua
array1 = {[1]="Google",name="Runoob",[4]="Runoob",[2]="saga"}  --输出1Google 2saga 
array2 = {[3]="Google",name="Runoob",[4]="Runoob",[2]="saga"}  --输出
for k,v in ipairs(array?) do
	print(k..v)
end
```

##### pairs

- 能遍历集合的所有元素。