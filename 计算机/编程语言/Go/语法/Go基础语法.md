





# **Go** 

### 变量

##### 声明

1. 使用var关键字  / 或省略关键字var（只能是**局部变量**声明 v_local := 6）

2. 多变量声明使用','进行分隔 或者 var(\n vaname v_type1 \n  vname2 v_type2 \n)，只能是**全局变量**
3. 声明格式 var v_name v_type / var v_name,v_name1,v_name2 v_type

##### 值类型

所有像 int、float、bool 和 string 这些基本类型都属于值类型，当使用等号 `=` 将一个变量的值赋值给另一个变量时，如：`j = i`，实际上是在内存中将 i 的值进行了拷贝，可以通过 &i 来获取变量 i 的内存地址，例如：0xf840000040（每次的地址都可能不一样）。值类型的变量的值存储在栈中。

##### 引用类型

一个引用类型的变量 r1 存储的是 r1 的值所在的内存地址（数字），或内存地址中第一个字所在的位置。这个内存地址为称之为指针，这个指针实际上也被存在另外的某一个字中。当使用赋值语句 r2 = r1 时，只有引用（地址）被复制。

##### 补充

1. 单纯地给**局部变量**赋值也是不够的，这个值必须被使用，不然会报错，但是**全局变量**不同
2. 想要交换两个变量的值，则可以简单地使用 a, b = b, a
3. 空白标识符 _ 也被用于抛弃值，如值 5 在：_, b = 5, 7 中被抛弃，相当于**占位符**

### 常量

##### 定义

```go
const identifier [type] = value
```

##### 枚举

```go
const (
    Unknown = 0
    Female = 1
    Male = 2
)
```

##### 计算表达式

常量可以用len(), cap(), unsafe.Sizeof()常量计算表达式的值。常量表达式中，函数必须是内置函数，否则编译不过：

```go
import "unsafe"
const (
    a = "abc"
    b = len(a)
    c = unsafe.Sizeof(a)
)
```

##### **特殊常量**

iota

在每一个const关键字出现时，被重置为0

然后再下一个const出现之前，每出现一次iota，其所代表的数字会自动增加1。

iota 可以被用作枚举值：

```go
const (
    a = iota
    b = iota
    c = iota
)
```

```go
const (
    a = iota
    b
    c     //默认等于上一个值，但是如果是iota，其代表的数字会自增1
)
```

### 分支语句

##### 语法（Select）

***TODO：待补充***

### 循环语句

##### 示例

1. ```go
   for a := 0; a < 10; a++ {}
   ```

2. ```go
   for a < b {} //类while
   ```

3. ```go
   for i,x:= range numbers {} //迭代器用法  
   ```

### 函数

##### 定义

```go
func function_name( [parameter list] ) [return_types]{
   函数体
}
/*示例
func PrintStr(targetStr string) bool {
	println(targetStr)
	return true
}*/
```

##### 补充

Go 函数可以返回多个值

```go
func swap(x, y string) (string, string) {
   return y, x
}
```

闭包是匿名函数，可在动态编程中使用

### 数组

##### 介绍

1. 相同唯一类型且长度固定
2. 索引从0开始

##### 声明

```go
var variable_name [SIZE] variable_type
var balance [10] float32
```

##### 初始化

```go
// 声明式
var arr1 [5]int
// 直接赋值
arr2 := [5]int{}
// 赋值并初始化值
arr3 := [5]int{1,2,3,4,5}
// 赋值，部分初始化
arr4 := [5]int{1,2,3}
// 赋值，自动计算数组长度
arr5 := [...]int{1,2,3,4,5}
// 赋值，通过下标初始化
arr6 := [5]string{0: "first", 2: "third", 1: "second"}
```

##### 补充

注意，数组在声明或赋值初始化后，对于没有主动初始化的空间，它会使用被声明的类型的初始值进行填充。
比如上面的arr4，它的具体内容将是：[1 2 3 0 0]

### 指针

##### 取地址符

&

##### 声明

```go
var var_name *var-type
var ip *int        /* 指向整型*/
var fp *float32    /* 指向浮点型 */
```

##### 空指针

一个指针被定义后没有分配到任何变量，值为 nil

### 结构体

##### 声明

```go
type struct_variable_type struct {
   member definition;
   member definition;
   ...
   member definition;
}
/*
type Books struct {
   title string
   author string
   subject string
   book_id int
}
*/
```

##### 初始化

```go
variable_name := structure_variable_type {value1, value2...valuen}
```

##### 结构体指针

```go
var struct_pointer *Books
struct_pointer = &Book1
struct_pointer.title
```

### 切片(Slice,引用类型，动态数组，类似Vector，两倍扩容)

##### 初始化

```go
// 声明式，这是长度为0的切片
var slice1 []int

// 赋值初始化，切片长度为5，容量为5
slice2 := []int{1, 2, 3, 4, 5}

// 通过make创建长度为5，容量为5的切片
slice3 := make([]int, 5)

// 通过make创建长度为5，容量为10的切片
slice4 := make([]int, 5, 10)

// 通过make创建长度为0，容量为10的切片
slice5 := make([]int, 0, 10)

// 赋值，通过下标初始化
slice6 := []string{0: "first", 2: "third", 1: "second"}
```

##### 扩容

```go
slice8 := []int{1, 2, 3, 4, 5}
// 追加单个元素
slice8 = append(slice8, 6)
// 追加多个元素
slice8 = append(slice8, []int{7, 8}...)
slice8 = append(slice8, 9, 10)
```

##### 截取片段

```go
arr8 := [5]int{1, 2, 3, 4, 5}
slice9 := []int{1, 2, 3, 4, 5}

// 从第二个元素开始截取
arr8[1:]
// 开始截取到第3个元素
arr8[:3]
// 截取下标[1,3)的元素
slice9[1:3]
```

##### 拷贝

```
copy(numbers1,numbers)
```

##### 补充

获取长度和容量

```
slice10 := make([]int, 5, 10)
length := len(slice10)
capacity := cap(slice10)
```

扩容测试

```go
slice12 := make([]int, 5, 10)
slice13 := append(slice12, 6)
slice13[0] = 1
// 猜猜这里会输出什么
fmt.Println("slice12: ", slice12,&slice12[0],&slice13[0])
//理解：这里没有扩容，slice12和slice13指向同一首地址，且slice12长度是5，而slice13长度为6

slice14 := make([]int, 5, 10)
slice15 := append(slice14, 6, 7, 8, 9, 10, 11)
slice15[0] = 1
// 猜猜这里会输出什么
fmt.Println("slice14: ", slice14,&slice14[0],&slice15[0])
//理解：这里扩容，重新给slice15分配内存（2倍），地址变化，之前的slice14地址和长度都没有变动
```

### 范围（range）

##### 描述

 range 关键字用于for循环中迭代数组(array)、切片(slice)、链表(channel)或集合(map)的元素。

在数组和切片中它返回元素的索引值，在集合中返回 key-value 对的 key 值。

##### 示例

```go
//这是我们使用range去求一个slice的和。使用数组跟这个很类似
nums := []int{2, 3, 4}
sum := 0
for _, num := range nums {
    sum += num
}
```

```go
//在数组上使用range将传入index和值两个变量。上面那个例子我们不需要使用该元素的序号，所以我们使用空白符"_"省略了。有时侯我们确实需要知道它的索引。
for i, num := range nums {
    if num == 3 {
        fmt.Println("index:", i)
    }
}
```

```go
  //range也可以用在map的键值对上。
kvs := map[string]string{"a": "apple", "b": "banana"}
for k, v := range kvs {
    fmt.Printf("%s -> %s\n", k, v)
}
```

```go
 //range也可以用来枚举Unicode字符串。第一个参数是字符的索引，第二个是字符（Unicode的值）本身。
for i, c := range "go" {
    fmt.Println(i, c)
}
```

### 集合(map)

##### 描述

可以迭代，但是无法决定返回顺序，因为Map使用hash表来实现的

##### 声明&创建

```go
/* 声明变量，默认 map 是 nil */
var map_variable map[key_data_type]value_data_type

/* 使用 make 函数 */
map_variable = make(map[key_data_type]value_data_type)

var countryCapitalMap map[string]string
   /* 创建集合 */
countryCapitalMap = make(map[string]string)
```

##### Contain

```go
/* 查看元素在集合中是否存在 */
   captial, ok := countryCapitalMap["United States"]
   /* 如果 ok 是 true, 则存在，否则不存在 */
```

##### Delete

```go
 /* 删除元素 */
   delete(countryCapitalMap,"France");
```

### 类型转换

##### 格式

```go
type_name(expression)
 mean = float32(sum)/float32(count)
```

### 接口

##### 描述

一种数据类型，任何其他类型只要实现了这些方法就是实现了这个接口。

##### 声明

```go
/* 定义接口 */
type interface_name interface {
   method_name1 [return_type]
}
/* 定义结构体 */
type struct_name struct {
   /* variables */
}
/* 实现接口方法 */
func (struct_name_variable struct_name) method_name1() [return_type] {
   /* 方法实现 */
}
```

##### 揣测

结构体和接口搭配可以模拟面向对象