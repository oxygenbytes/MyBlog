---
title: "C++对象模型"
date: 2021-02-23T17:38:43+08:00
draft: false
toc: false
tags:
  - Cplus
---

## 什么是C++对象模型?

1. 语言中直接支持面向对象程序设计的部分。
2. 对于各种支持的底层实现机制。

对象模型研究的是对象在存储上的空间与时间上的更优，并对C++面向对象技术加以支持，如以虚指针、虚表机制支持多态特性。

## 理解虚函数表

C++中虚函数的作用主要是为了实现多态机制。多态，简单来说，是指在继承层次中，父类的指针可以具有多种形态——当它指向某个子类对象时，通过它能够调用到子类的函数，而非父类的函数。

```cpp
#include <iostream>
using namespace std;

class Base {
public:
	 virtual void print(){ cout<<"Base"<<endl;};
};
class Derive : public Base{
public:
    virtual void print(){cout<<"Derive"<<endl;};
};

int main(){

    Base* ptr1 = new Base;
    Base* ptr2 = new Derive;

    ptr1->print(); // Base::print();
    ptr2->print(); // Derive::print();

    return 0;
}
```

这是一种运行期多态，即父类指针唯有在程序运行时才能知道所指的真正类型是什么。这种运行期决议，是通过虚函数表来实现的。

## 使用指针访问虚表

```c++
#include <iostream>
using namespace std;

class Base {
private:
	int a;
public:
	virtual void test(){
		cout<<"test"<<endl;
	}
	virtual void print(){ cout<<"Base"<<endl;}
};


typedef void(*Func)(void);


int main(){

	Base b;
	int * vptrAdree = (int *)(&b);  
	cout<<vptrAdree<<endl;

	Func fun = (Func)*(int * )(*(int*)(&b)+8);

	fun(); // Base
    return 0;
}

```
我们强行把类对象的地址转换为 int* 类型，取得了虚函数指针的地址。虚函数指针指向虚函数表,虚函数表中存储的是一系列虚函数的地址，虚函数地址出现的顺序与类中虚函数声明的顺序一致。对虚函数指针地址值，可以得到虚函数表的地址，也即是虚函数表第二个虚函数的地址。

# 对象模型概述

在C++中，有两种数据成员（class data members）：static 和nonstatic,以及三种类成员函数（class member functions）:static、nonstatic和virtual:

那么，这个类在内存中将被如何表示？5种数据都是连续存放的吗？如何布局才能支持C++多态？ 我们的C++标准与编译器将如何塑造出各种数据成员与成员函数呢？

## 4.1.简单对象模型

**说明：在下面出现的图中，用蓝色边框框起来的内容在内存上是连续的。**
这个模型非常地简单粗暴。在该模型下，对象由一系列的指针组成，每一个指针都指向一个数据成员或成员函数，也即是说，每个数据成员和成员函数在类中所占的大小是相同的，都为一个指针的大小。这样有个好处——很容易算出对象的大小，不过赔上的是空间和执行期效率。想象一下，如果我们的Point3d类是这种模型，将会比C语言的struct多了许多空间来存放指向函数的指针，而且每次读取类的数据成员，都需要通过再一次寻址——又是时间上的消耗。
所以这种对象模型并没有被用于实际产品上。

## 4.2.表格驱动模型

这个模型在简单对象模型的基础上又添加一个间接层，它把类中的数据分成了两个部分：数据部分与函数部分，并使用两张表格，一张存放数据本身，一张存放函数的地址（也即函数比成员多一次寻址），而类对象仅仅含有两个指针，分别指向上面这两个表。这样看来，对象的大小是固定为两个指针大小。这个模型也没有用于实际应用于真正的C++编译器上。

## 4.3.非继承下的C++对象模型

概述：在此模型下，nonstatic 数据成员被置于每一个类对象中，而static数据成员被置于类对象之外。static与nonstatic函数也都放在类对象之外，而对于virtual 函数，则通过虚函数表+虚指针来支持，具体如下：

- 每个类生成一个表格，称为虚表（virtual table，简称vtbl）。虚表中存放着一堆指针，这些指针指向该类每一个虚函数。虚表中的函数地址将按声明时的顺序排列，不过当子类有多个重载函数时例外，后面会讨论。
- 每个类对象都拥有一个虚表指针(vptr)，由编译器为其生成。虚表指针的设定与重置皆由类的复制控制（也即是构造函数、析构函数、赋值操作符）来完成。vptr的位置为编译器决定，传统上它被放在所有显示声明的成员之后，不过现在许多编译器把vptr放在一个类对象的最前端。
  另外，虚函数表的前面设置了一个指向type_info的指针，用以支持RTTI（Run Time Type Identification，运行时类型识别）。RTTI是为多态而生成的信息，包括对象继承关系，对象本身的描述等，只有具有虚函数的对象在会生成。

### 参考

1. [图说C++对象模型：对象内存布局详解](https://www.cnblogs.com/QG-whz/p/4909359.html)

