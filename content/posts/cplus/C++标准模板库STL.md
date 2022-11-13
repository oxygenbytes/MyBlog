---
title: "C++标准模板库STL"
date: 2021-06-13T20:43:09+08:00
draft: false
comments: false
images:
---
注： size()、empty()是所有容器都有的，时间复杂度为 O(1)，并不是结果并非遍历得到，而是原本就有个变 量来存size，直接访问该变量即可

注：系统为某一程序分配空间时，所需时间与空间大小无关，而是与申请次数有关---倍增思想的原理

## vector 变长数组，倍增的思想

```c++
size() 返回元素个数
empty() 返回是否为空
clear() 清空
front()/back() 
push_back()/pop_back()
begin()/end()
[] 即和数组一样，支持随机寻址
支持比较运算，按字典排序:
vector <int> a(3, 5), b(5,3);
if(a > b) cout << " a > b ";

遍历方式：
//遍历方法一
for(auto x:a)   cout << x << ' ';
//遍历方法二 迭代器可以看成是指针
for(int i = 0; i < a.size(); i ++)  cout << a[i] << ' ';
//遍历方法三 迭代器可以看成是指针
for(vector <int> :: iterator i = a.begin(); i != a.end(); i ++) cout << *i << ' ';
```

## pair 
```c++
    pair <int, int>
    first 第一个元素
    second 第二个元素
    支持比较运算， 以第一个为第一关键字， 第二个为第二关键字（字典序)---可用于按某一属性排序，将待排属性放
    在第一个元素位置
pair 初始化方式：
    pair <string , int> p;
    p = {"hello",  20}
    p = make_pair("hello", 20);
    cout << p.first << ' ' << p.second ;

也可以用pair存储两个以上的属性，如：pair(int ,pair<int, int>);
```

## string 字符串

```c++
基本操作
    substr(), c_str()  //c_str()  返回 const 类型的指针
    size()/length() 返回字符串长度
    empty()
    clear()//清空整个字符串
    erase() //erase(1,2) 删除以1为索引，长度为2的字符串
    []

支持比较运算，按字典序进行比较  
    a < "hello" 或 a.compare("hello");//a.compare() 返回具体的比较值

字符串变量和字符数组之间的转化：
    char ch[] = "hello"; string str = "world";
    ch[] -> str :   str = ch;
    str -> ch[] :   strcpy(ch,str.c_str());

string 初始化:
    string a("hello");
    string a = "hello";

取子串：//很常用
    a.substr(1,3);//返回下标从1开始且长度为3的子串，包括左端点  

拼接字符串：
    a += "world";//新增字符串
    a.append(" world");//新增字符串
    a.push_back('.');//在字符串末新增单个字符

在字符串指定位置添加字符串
    a.insert(3,"world");

访问字符串：string str;
    cout << str[2];//以下标方式访问
    cout << str.at(2);//通过at()方法访问
    getline(cin,str );;//读取一行字符赋值给str
    getline(cin, str,'!');//读取一行字符赋值给str,以！结束

字符串排序：
    sort(str.begin(),str.end());//需要包含头文件algorithm

可以使用STL接口，可以理解为一个特殊的容器，容器里装的是的字符
    a.push_back('.');//在字符串末新增单个字符
    a.pop_back();

字符串变量的交换和取代：
    a.swap(str);//str 为字符串变量
    a.replace(1,2,str2) //用字符串str2取代字符串a下标为1长度为2的子串
```
## deque 双端队列
缺点：慢，但用的不是很多，因为它要比一般的数组慢好几倍

```c++
    size()
    empty()
    clear()
    front() / back()
    push_back() / pop_back()
    push_front() / pop_front()
    begin() / end()
    []
```

## 容器适配器
C++ 提供了三种容器适配器(contain adapter):
stack, queue, priority_queue。
1. stack和queue基于deque实现
2. priority_queue基于vector实现

容器适配器的作用大概类似于电源适配器，将标准电压转化成各种需要的电压。

你完全可以在deque上按照stack的方式工作，但是deque太强大了，它提供了远超stack的操作所需的各种接口
但凡你有一个失误，创建的栈就毁了。

### queue 队列
```c++
    size()
    empty() 
    push()  //向队尾插入一个元素
    front() //返回对头元素
    pop()   //弹出对头元素
    back()  //返回队尾元素
```
### priority_queue 优先队列

priority_queue<Type, Container, Functional>
如果不写后两个参数，那么容器默认用的是vector，比较方式默认用operator<，也就是优先队列是大顶堆，队头元素最大。

Type为数据类型， Container为保存数据的容器，Functional为元素比较方式。
```c++
#include<iostream>
#include<queue>
using namespace std;
 
int main(){
	priority_queue<int> p;
	p.push(1);
	p.push(2);
	p.push(8);
	p.push(5);
	p.push(43);
	for(int i=0;i<5;i++){
		cout<<p.top()<<" ";
		p.pop();
	}
	return 0;
}
// 43 8 5 2 1
//升序队列
priority_queue <int,vector<int>,greater<int> > q;
//降序队列
priority_queue <int,vector<int>,less<int> >q;
//greater和less是std实现的两个仿函数（就是使一个类的使用看上去像一个函数。其实现就是类中实现一个operator()，这个类就有了类似函数的行为，就是一个仿函数类了）

其实就是堆，默认是大根堆

    push() //插入一个元素
    top()  // 返回堆顶元素
    pop()  //弹出堆顶元素
将小根堆转化为大根堆：
方法1： priority_queue<int,vector<int>,greater<int>> heap; //定义一个小根堆heap;
方法2： 以负数来存
```

### stack 栈

```c++
    size()
    empty()
    push()  //向栈顶插入一个元素
    top()   //返回栈顶元素
    pop()   //弹出栈顶元素
```
## set, map, multiset, multimap
基于平衡二叉树（红黑树）， 动态维护有序序列

```c++
    set 与 multiset 的区别：set 里面不可以有重复元素，而multiset 可以有
    size()
    empty()
    clear()
    begin() / end() ++, -- 返回前驱和后继， 时间复杂度： O(logn)
```
### set/multiset 集合

```c++
    insert() 插入一个数
    find()   查找一个数
    count()  返回某个数的个数

    erase()
        注意：(1)(2)在set中无区别，但在multiset里有区别
        (1) 输入是一个整数x, 删除所有x          时间复发度： O(k  + logn)  //k是所有元素的个数
        (2) 输入一个迭代器， 删除这个迭代器

    注意： lower_bound()/upper_bound() ----- 核心操作
    lower_bound(x) 返回大于等于x的最小的数的迭代器
    upper_bound(x) 返回大于x的最小的数的迭代器
```

### map/multimap 哈希表

```c++
    insert()  插入的一个数是一个pair         用的不多
    erase()   输入的参数是pair 或 是迭代器   用的较多
    find()
    []        时间复杂度： O(logn)           最主要的操作
    lower_bound()/upper_bound()
```


### unordered_set/map/multiset/multimap 哈希表

和上面类似，增、删、改、查的时间复杂度是 O(1) --- 优势
和上面的区别：凡是和排序有关的操作都是不支持的,如：不支持 lower_bound()/upper_bound() 迭代器的++，-- 等

## bitset
压位, 存储相同的数据量，存储空间仅占bool变量的 1/8

```c++
    定义变量： bitset<10000> s   //注意<>中存的不是类型，而是个数
    ~,&, |, ^
    >> , <<
    == , != 
    []
    count()     返回有多少个1
    any()       判断是否至少有一个1
    none()      判断是否全为0
    set()       把所有位置为1
    set(k, v)   把第k位置为1
    reset()     把所有位置为0
    flip()      等价于~
    flip(k)     把第k位取反
```

