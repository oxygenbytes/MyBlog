---
title: "侯捷C++程序设计"
date: 2019-06-27T09:06:27+08:00
draft: false
toc: false
images:
tags:
  - C++
---

[课程链接](https://www.youtube.com/playlist?list=PL_qkCOD3sKurKd4YsdLpSp2BAKvgW6FaH)

##  基本语法知识

1. \<iostream> 尖括号是使用标准头文件 

   "matrix.h" 调用自给定头文件

2. 构造函数可以重载(overload)

3. 对于没有用到指针的类，一般不用写析构函数

4. 构造函数可以放在private里，这就是设计模式中的单例模式(singleton)

```cpp
class Singleton
{
private:
   Singleton();

public:
   static Singleton& instance()
   {
      static Singleton INSTANCE;
      return INSTANCE;
   }
};
```

5. 常量成员函数

将const关键字放在函数声明之后,意在强调该函数不可以改变其参数，只有成员函数才可以。

```c++
class Complex{
    double re;
    double im;
    double real() const {return re};   
    double imag() return {return im};
};
{
    Complex c1(2,1);
    cout<<c1.real()<<endl; //right
    const Complex c2(2,1);
    cout<<c2.imag()<<endl; //wrong
}
```

6. C++引用其底层就是指针，但是这里做了封装

>1. 引用既可以作为函数参数，用以避免参数的复制，也可以用于对参数进行改变
>
>2. 如果不想更改参数值，但是又想避免复制带来的开销，可以使用常引用， 即const ListNode&
>
>3. C++引用除了可以作为函数参数，还可以用作返回值，其目的与用作参数一致
>4. return by reference 不能使用的情况：返回值是函数局部变量，函数结束时候该变量被释放

7. friend关键字 

> friend函数可以自由的取得对应类的private数据
>
> 相同class的各个objects互为friends

8. c++防御式声明

```c++
#ifndef __COMPLEX__
#define __COMPLEX__

#endif
```

9. inline关键字

>在C/C++中，內联（inline）指的是在使用函数的地方不进行函数调用，而是将函数的实现代码插入到此处。 这样能够以增加代码大小为代价，省下函数调用过程产生的开销，加快程序执行速度。 內联属于编译器的一个优化措施，而inline关键字就是用来告诉编译器，希望对指定的函数做內联优化。
>
>所谓“希望”，意思就是这仅仅是程序员对编译器的优化建议，并不能强制编译器必须将指定的函数內联。 因此，如果一定要将一个函数內联，用inline关键字是不行的，需要使用编译器扩展或配合编译器优化选项。

10. 返回引用

>当返回一个引用时，要注意被引用的对象不能超出作用域。所以返回一个对局部变量的引用是不合法的，但是，可以返回一个对静态变量的引用。
>
>函数返回引用的时候，可以利用全局变量（作为函数返回），或者在函数的形参表中有引用或者指针（作为函数返回），这两者有一个共同点，就是返回执行完毕以后，变量依然存在，那么返回的引用才有意义。
>
>当不希望返回的对象被修改的时候，可以添加const。
>
>a reference is a pointer which will auto dereference. 引用是自带解引用的指针(reference=*ptr)
>
>引用使用时无需[解引用](https://link.zhihu.com/?target=https%3A//baike.baidu.com/item/%E8%A7%A3%E5%BC%95%E7%94%A8)(*)，指针需要解引用；
>
>​    “sizeof 引用”得到的是所指向的变量(对象)的大小，而“sizeof 指针”得到的是指针本身(所指向的变量或对象的地址)的大小；
>
>​    引用不能为空，指针可以为空；
>
>​    指针和引用的自增(++)运算意义不一样；引用自增被引用对象的值，指针自增内存地址。

11. 友元函数

>类的友元函数是定义在类外部，但有权访问类的所有私有（private）成员和保护（protected）成员。尽管友元函数的原型有在类的定义中出现过，但是友元函数并不是成员函数。
>
>友元可以是一个函数，该函数被称为友元函数；友元也可以是一个类，该类被称为友元类，在这种情况下，整个类及其所有成员都是友元。
>
>如果要声明函数为一个类的友元，需要在类定义中该函数原型前使用关键字 **friend**

12. strlen的实现原理和计数方法

strlen所作的是一个计数器的工作，它从内存的某个位置（可以是字符串开头，中间某个位置，甚至是某个不确定的内存区域）开始扫描，直到碰到第一个字符串结束符'\0'为止，然后返回计数器值(长度不包含'\0')。

13. c++深拷贝和浅拷贝

>C++中类的拷贝有两种：深拷贝，浅拷贝：当出现类的等号赋值时，即会调用拷贝函数
>两个的区别
>1  在未定义显示拷贝构造函数的情况下，系统会调用默认的拷贝函数——即浅拷贝，它能够完成成员的一一复制。当数据成员中没有指针时，浅拷贝是可行的；但当数据成员中有指针时，如果采用简单的浅拷贝，则两类中的两个指针将指向同一个地址，当对象快结束时，会调用两次析构函数，而导致指针悬挂现象，所以，此时，必须采用深拷贝。
>2 深拷贝与浅拷贝的区别就在于深拷贝会在堆内存中另外申请空间来储存数据，从而也就解决了指针悬挂的问题。简而言之，当数据成员中有指针时，必须要用深拷贝。

14. 重载<<符号

```c++
class String{
public:
    char* get_c_str() const {return m_data};
private:
    char* m_data;
}
ostream& operator<< (ostream& os, const String& str){
    // 对于运算符重载的两个参数，第一个在运算符前，第二个在运算符后
    // 对于此函数而言，os << str;
    os << str.get_c_str();
    return os; // 这里返回os可以保证连续使用运算符 cout<<a<<b
    // 先执行cout<<a ==> cout,然后执行cout<<b
}
{
    String s1{"hello "};
    cout << s1; // cout是一个ostream对象
}
```

15. 堆，栈，内存管理

stack：当你调用函数，函数本身就会形成一个stack用来放置参数，返回地址，局部变量等。

heap: （system heap） 由操作系统分配的一块全局内存空间。程序可以动态分配后从中获得若干区块。

a. 局部变量，对象放置在stack中，当作用域结束其内存就会自动释放。

b. 静态变量/全局变量，保存在静态区中，使用`static` 关键字或写在任何作用域之外，作用域结束之后仍存在，直到程序结束。

c. 通过`new` 申请的的变量，对象会被保存在堆中，只有当使用 `delete` 函数之后其内存才会被释放。

16. `new` 关键字的实现原理：先分配内存（底层通过malloc实现），然后调用对象的构造函数。`delete` 关键字的实现原理：先调用对象的析构函数，然后释放内存（底层通过free实现）。

17. [动态分配所得的内存块（VC）](https://www.youtube.com/watch?v=7VojokbA4aM&list=PL_qkCOD3sKupGq_6w-vI4u7MQcjbQEOuD&index=9&t=0s)

    [动态分配的内存块](https://yq.aliyun.com/articles/681152?spm=a2c4e.11153940.0.0.7f67a8bavAOgqS)

18. static关键字

作用
1. 修饰普通变量，修改变量的存储区域和生命周期，使变量存储在静态区，在 main 函数运行前就分配了空间，如果有初始值就用初始值初始化它，如果没有初始值系统用默认值初始化它。
2. 修饰普通函数，表明函数的作用范围，仅在定义该函数的文件内才能使用。在多人开发项目时，为了防止与他人命名空间里的函数重名，可以将函数定位为 static。
3. 修饰成员变量，修饰成员变量使所有的对象只保存一个该变量，而且不需要生成对象就可以访问该成员。
4. 修饰成员函数，修饰成员函数使得不需要生成对象就可以访问该函数，但是在 static 函数内不能访问非静态成员。

`static member functions` 只能处理 `static member data` 

19. 类模板

```c++
template<typename T> 
class complex{ // 类模板，作为一系列类的模板
public:
	complex(T r = 0,T i = 0) : re(r), im(i) { }
private:
	T re,im;
};
complex<int> //模板类 ，将类模板具体化得到的类叫做模板类
```

```c++
template<typename T>
inline const T& min(const T& a, const T& b){
    return b < a ? b : a;
}
class Stone{
public:
    bool operator< (const stone& rhs) const {return _weight < rhs._weight;}
private:
    int _weight;
};
stone r1(2,3),r2(3,3),r3;
r3 = min(r1,r2); // 函数模板无需特殊写明，编译会自动进行类型推导

```

20. 命名空间

```c++
namespace std // 命名空间声明
{

}
using namespace std; // 使用方式
int main{
    cout<<a;
    std::cout<<a;
}
```

21. 面向对象设计--三大特性

    a. 封装 (has-a)

    b. 继承 (is-a)

    c. 多态(virtual function)

### 面向对象设计原则

**面向对象设计原则（1）**

依赖倒置原则（DIP）

- 高层模块（稳定）不应该依赖于低层模块（变化），二者都应该依赖于抽象（稳定）。
- 抽象（稳定）不应该依赖于变化），实现细节应该依赖于抽象（稳定）。

**面向对象设计原则（2）**

开放封闭原则（OCP）

- 对扩展开放，对更改封闭。
- 类模块应该是可扩展的，但是不可修改。

**面向对象设计原则（3）**

单一职责原则（SRP）

- 一个类应该仅有一个引起它变化的原因。
- 变化的方向隐含着类的责任。

**面向对象设计原则（4）**

Liskov 替换原则（LSP）

- 子类必须能够替换它们的基类（IS-A）。
- 继承表达类型抽象。

**面向对象设计原则（5）**

接口隔离原则（ISP）

- 不应该强迫客户程序依赖它们不用的方法。
- 接口应该小而完备。

**面向对象设计原则（6）**

优先使用对象组合，而不是类继承

- 类继承通常为“白箱复用”，对象组合通常为“黑箱复用”
- 继承在某种程度上破坏了封装性，子类父类耦合度高。
- 而对象组合则只要求被组合的对象具有良好定义的接口，度低。

**面向对象设计原则（7）**

封装变化点

- 使用封装来创建对象之间的分界层，让设计者可以在分界的一侧进行修改，而不会对另一侧产生不良的影响，从而实现层次间的松耦合。

  **面向对象设计原则（8）**

针对接口编程，而不是针对实现编程

- 不将变量类型声明为某个特定的具体类，而是声明为某个接口。
- 客户程序无需获知对象的具体类型，只需要知道对象所具有的接口。

减少系统中各部分的依赖关系，从而实现“高内聚、松耦合”的类型设计方案。


### 转换函数

```cpp
#include <bits/stdc++.h>
using namespace std;
// Conversion function
class Fraction // 分数类
{
public:
    Fraction(int num,int den = 1) : son(num),mum(den) {}
    // 将Fraction类转化为double
    operator double() const{ // 转换函数，无需返回类型
        return (double) (son / mum);
    } 
private:
    int son;
    int mum;
};

int main(){
    Fraction f(10,2);
    cout<<(double)f<<endl;
    return 0;
}
```

### Non-explicit-one-argument ctor

```cpp
class Fraction // 分数类
{
public:
    Fraction(int num,int den = 1) : son(num),mum(den) {}
  
	Fraction operator+ (const Fraction& f) { 
        return Fracton(...);
    } 
private:
    int son;
    int mum;
};

int main(){
    Fraction f(3,4);
    Fraction d2=f+4;
    // 调用non-explicit ctor将4转换为Fraction，并调用operator+
}
```

### explict关键字

```cpp
class Fraction
{
public:
    // 当使用explict的时候，说明只有在构造函数被显式调用的时候，才会进行自动转换
    explict Fraction(int num,int den = 1) : son(num),mum(den) {}
private:
    int son;
    int num;
}
int main(){
    Fraction f(3,5);
    Fraction d2=f+4;
}
```

### C++智能指针(pointer-like classes)

```c++
template<typename T>
// 智能指针是一个类模板
class shared_ptr{
public:
    T& operator*() const // 重载*操作符
    { return *px;}
    T* operator->() const // 重载->操作符
    { return px;} // -> 具有连续传递性，见下
    
    shared_ptr(T* p) : px(p) {}
private:
    T* px;
    long* pn;
};

struct Foo{
    void method(void) {}
};

int main(){
    shared_ptr<Foo> sp{new Foo};
    Foo f(*sp);
    sp->method; // [sp->]method == [px]->method 
}
```

迭代器也是一种特殊的智能指针，同时迭代器还要比一般的智能指针重载 `++` , `--` 等运算符，同时对 `*` , `->` 运算符要进行特殊的重载。

```c++
// cpp list容器的迭代器 -- 双向链表
reference operator*() const
{ return (*node).data;} // 指针*直接返回数据
pointer operator->() const
{ return &(operator*());}
```

### function like classes

```cpp
// 仿函数
template <typename T>
struct identity ：public unary_function<T,T>{
    const T& operator() (const T& x) const { return x;}
};
// 仿函数的基类
template<class Arg, class Result> // 单操作数基类
struct unary_function {
   typedef Arg argument_type;
   typedef Result result_type;
};
```

函数对象要重载`()` 操作符。

### namespace 经验谈

```cpp
namespace testspace{
void test_member_template(){}
}
int main(){
	testspace::test_member_template();
}
```

### 成员模板

```cpp
template <class T1, class T2>
struct pair {
    T1 first;
    T2 second;
    // 以下为成员模板
    template<class U1,class U2>
    pair(const pair<U1,U2>& p){
        // U1,U2要满足的条件
        first(p.first),second(p.second);
    }
};

pair<Base1,Base2> p2(pair<Derived1,Derived2>());
```

### 模板特化

```cpp
// 泛化
template <class Key>
struct hash {};

// 特化1
template<>
struct hash<char> {
	// ...
	size_t operator() (char x) const { return x;}
}

// 特化2
template<>
struct hash<int> {
	// ...
	size_t operator() (int x) const (return x;)
}
int main(){
    cout<< hash<int>()/*调用特化2 operator()*/(100)/* init parm*/ << endl;
}
```

###  模板偏特化

```cpp
template<typename T,typename Alloc=...>
class vector
{
    //...
};
//将T绑定到bool
template<typename Alloc=...>
class vector<bool, Alloc>
{
    // ...
}
```

### 模板模板参数

```cpp
template<typename T,
		template<typename T>
			class Container
        >
class XCls
{
private:
    Container<T> c;
public:
    // ...
};

template<typename T>
using Lst = list<T, allocator<T>>;

/* WRONG */ XCls<string,list> mylist1; // list未绑定
/* RIGHT */ XCls<string,Lst> mylist2; // Lst仍然是一个类模板
```

下面这个不是模板模板参数

```cpp
template <class T,class Seqence = deque<T>>
class stack {
    friend bool operator== <> (const stack&,const statck&);
protected:
    Sequence c;
};

stack<int,list<int>> s2; // list的类型已经绑定
```

### vptr && vtbl

```cpp
class A{
public:
    virtual void vfunc1();
    virtual void vfunc2();
private:
    int m_data1,m_data2;
};


class B : public A{
public:
    virtual void vfunc1(); // override
};
```

当某个类具有虚函数的时候，那么其生成的类就会有一个指针，会指向一个虚函数表，这个指针就是vptr。虚函数表就是vtbl。

### C++动态绑定

静态绑定的形式

1. `call xxx` ，其中xxx是地址。

动态绑定的条件

1. 通过指针调用。包括this指针。
2. 有向上转型的动作。
3. 调用虚函数。

```cpp
// B继承A
A* pa = new B;
pa->vfunc1(); //vfunc1是虚函数
```

### new && delete操作符重载

 全局性重载，影响层面极广

```cpp
void* myAlloc(size_t size){
	return malloc(size);
}
// 全局性重载1，影响层面极广
void* myfree(void* ptr){
	return free(ptr);
}

inline void* operator new(size_t size){
	cout<<"my global new()"<<endl;
	return myAlloc(size);
}
```

重载成员函数中的`new,delete,new[],delete[]`

```cpp
class Foo{
public:
    void* operator new[] (size_t);
    void* operator delete[](void*, size_t);
};

try{
    // 下面的1处
    void* mem = operator new(sizeof(Foo)*N+4);
    p = static_cast<Foo*>(mem);
    p->Foo::Foo(); // N次
}

int main(){
    // 1
    Foo* p = new Foo[N];
}
```

### C++虚函数

基类的析构函数一定要写成虚函数，这样当进行多态调用的时候，才会执行基类的虚函数。

### 容器适配器

C++ 提供了三种容器适配器(contain adapter):
stack, queue, priority_queue。

1. stack和queue基于deque实现
2. priority_queue基于vector实现

容器适配器的作用大概类似于电源适配器，将标准电压转化成各种需要的电压。

你完全可以在deque上按照stack的方式工作，但是deque太强大了，它提供了远超stack的操作所需的各种接口
但凡你有一个失误，创建的栈就毁了。

# 如何理解C++多态？

### 多态的意义：

多态是面向对象的三大特性之一。

面向对象的三大特性分别是：封装，继承，多态。

### 多态的条件：

1. 继承
2. 重写父类方法

### 多态的本质：

多态：不同的子类调用相同的父类方法，产生不同的结果。函数有多个状态，即为多态。

面向对象程序设计的一个重要特性是多态性，复习理解下C++ 是如何支持多态的。
接下来会涉及基类、派生类、虚函数、纯虚函数、抽象类的概念。

C++ 的类继承中，被继承者被称为基类（base class），继承者被称为派生类（derived class）。指向派生类的指针类型与指向基类的指针类型是兼容的（反之不成立！）。这个简单的特性是C++ 多态性的基础。
(注意：可以用基类类型指针指向派生类类型的实例，反之不然）

1，虚函数
我们面对一个问题：使用基类类型指针去引用派生类的成员时，这些成员必须也在基类中定义过。然而，一个基类的多个不同的派生类，对“同一个”成员函数的实现很可能是不一样的，因此，我们无法直接在基类中实现该成员函数。例如，对于基类“多边形”，派生类“正方形” 和 “三角形“对于成员函数”求面积“的实现是不同的。



