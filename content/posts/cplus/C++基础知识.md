---
title: "C++基础知识"
date: 2019-06-27T09:06:27+08:00
draft: false
toc: false
images:
tags:
  - C++
---

### const常引用（const + &）避免函数参数的双向传递

在c++可以使用引用传递作为函数的形参传入函数，相较于值传递的方式，引用传递能够节省函数使用时的内存分配，不需要像值传递一样拷贝实参。对于普通的数据类型可能看出引用的优势，但是如果函数的传入参数是一个十分复杂的结构体或者类，那么引用传递可以节省很大的内存开销。

然而，由于引用传递是双向的，当在函数中对于形参的数据进行改变后，实参的值也会进行相应的改变，如下所示：

```c++
#include <iostream>
using namespace std;

struct Point
{
    int x;
    int y;
    
    Point(int a, int b)
    {
	x=a;
	y=b;
    }
};

void fun(Point& point);

int main()
{
    Point point(1,1);
    fun(point);
    point.x++;
    point.y++;
    cout << "======main======" << endl;
    cout << "点的坐标为(" << point.x << "." << point.y << ")" << endl;
    return 0;
}


void fun(Point& point)
{
    point.x++;
    point.y++;
    cout << "======fun======" << endl;
    cout << "点的坐标为(" << point.x << "," << point.y << ")" << endl;
}
/*
------fun-------
点的坐标为（2,2）
------main------
点的坐标为(2,3)
```

如果我们既不想改变传入参数的值，也不想因为值传递产生太大的开销，那么可以尝试一下使用常引用。可见，使用了常引用之后，传入参数的值就是一个常量了，无法对其内部变量进行修改，保证了传入参数的数据安全性。

这里引用的作用主要是为了避免值传递，值传递通常会有很大的开销。

### C语言三个结束符有什么不同？ EOF ‘\0’ '\n'

#### 网友A: 

EOF（End of file）是C/C++里面的宏定义，具体定义式是#define EOF -1，表示的是文件的结束标志，值等于-1，一般用在文件读取的函数里面，比如fscanf fgetc fgets等，一旦读取到文件最后就返回EOF标志并结束函数调用
'\0'是转义字符，值等于0，主要用在C风格字符串的末尾，表示字符串结束标志。通常用在和字符串相关的函数里面，如strcmp strcpy等会用到它
'\n'表示换行符，通常用作一些读取函数的读取结束标志，比如scanf,getchar(),gets()等，一旦遇到'\n'就结束读取并返回

#### 网友B:

EOF 是一个宏定义,一般是-1,用在读文件的时候.因为如果读到字符,这个字符的值一定是正的,所以用负值表示结束
\0 是ascii码为0,一般表示用在字符串结尾表示空值.一个char a[100]数组,当你用这个数组进行字符串操作时,会把\0当做结尾.如果没有设置\0标志,这个字符串很可能出现问题
\n 好像ascii码是10吧,就是回车的意思,a是1个字符,c也是1个字符,同样的,回车也是1个字符,只不过表现得不那么正常而已

### extern "C"

```c++
#ifndef __INCvxWorksh  /*防止该头文件被重复引用*/
#define __INCvxWorksh

#ifdef __cplusplus    //__cplusplus是cpp中自定义的一个宏
extern "C" {          //告诉编译器，这部分代码按C语言的格式进行编译，而不是C++的
#endif

    /**** some declaration or so *****/  

#ifdef __cplusplus
}
#endif

#endif /* __INCvxWorksh */
```

**2、被extern "C"修饰的变量和函数是按照C语言方式编译和链接的**
 首先看看C++中对类似C的函数是怎样编译的。
 作为一种面向对象的语言，C++支持函数重载，而过程式语言C则不支持。函数被C++编译后在符号库中的名字与C语言的不同。例如，假设某个函数的原型为：
 void foo( int x, int y );
 该函数被C编译器编译后在符号库中的名字为_foo，而C++编译器则会产生像_foo_int_int之类的名字（不同的编译器可能生成的名字不同，但是都采用了相同的机制，生成的新名字称为“mangled name”）。
 ** _foo_int_int这样的名字包含了函数名、函数参数数量及类型信息，C++就是靠这种机制来实现函数重载的。** 例如，在C++中，函数void foo( int x, int y )与void foo( int x, float y )编译生成的符号是不相同的，后者为_foo_int_float。
 同样地，C++中的变量除支持局部变量外，还支持类成员变量和全局变量。用户所编写程序的类成员变量可能与全局变量同名，我们以"."来区分。而本质上，编译器在进行编译时，与函数的处理相似，也为类中的变量取了一个独一无二的名字，这个名字与用户程序中同名的全局变量名字不同。

###  while(scanf("%d",&n)!=EOF) 用法

EOF(end of file)就是文件的结束，通常来判断文件的操作是否结束的标志。

EOF不是特殊字符，而是定义在头文件<stdio.h>的常量，一般等于-1；

```c++
#include<stdio.h>
int main(){
   char str[100][100];
   int i=0,j;
	while(scanf("%s", str[i]) != EOF)
        //在黑框中手动输入时，系统并不知道什么时候到达了所谓的“文件末尾“
        //因此需要用< Ctrl + Z >组合键，然后按< Enter >键的方式来告诉系统已经到了 EOF，这样系统才会结束 while
	i++;                           //while((str[i]=getchar())!='\n')
	for(j=i-1;j>=0;j--){
		printf("%s",str[j]);
		if(j!=0)
			printf(" ");
	} 
 
	return 0;
}
```

除了文件结束，做题遇见最多的是标准输入，但是标准输入与文件不一样，无法事先知道输入的长度，必须手动输入一个字符，表示到达EOF：

Linux中，在新的一行的开头，按下Ctrl-D，就代表EOF（如果在一行的中间按下Ctrl-D，则表示输出“标准输入”的缓存区，所以这时必须按两次Ctrl-D）；

Windows中，Ctrl-Z表示EOF。 

### 结构体可以用作 `map` 的键吗？

答： 可以，结构体是可以作为 `map` 的键的，但需要满足一定的条件。首先 `map` 的底层结构是 `红黑树` ，属于 `平衡二叉查找树` 。**对于map来说， key必须是有序的， 也就是说， key与key之间必须能比较， 所以需要重载  `<` 号** 。所以当结构体作为 `map` 的键时，必须要重载 `<` 运算符。

```c++
#include <iostream>
#include <string>
#include <map>
using namespace std;
 
struct Info
{
    string name;
    int score;
 	// 重载 < 运算符
    bool operator< (const Info &x) const
    {
        return score < x.score;
    }
};
 
int main()
{
    Info a, b;
 
    a.name = "eric";
    a.score = 90;
 
    b.name = "cat";
    b.score = 85;
 
 
    map<Info, int> m;
    m[a] = 1;
    m[b] = 2;
 
    map<Info, int>::iterator it;
    for(it = m.begin(); it != m.end(); it++)
    {
        cout << it->first.name << endl;
    }
 
    return 0;

```

### C++中虚函数表存储在什么位置？

C++中**虚函数表位于只读数据段（.rodata），也就是C++内存模型中的常量区；而虚函数则位于代码段（.text），也就是C++内存模型中的代码区。**

### C++中能不能在 `main` 前执行代码？

答：可以。

1. 全局类变量的构造都在main之前。可以通过全局变量来在 `main` 前面执行代码。
2. `static` 标识符标记的全局变量在程序初始化阶段，先于 `main` 执行。

```c++
//全局static变量的初始化在程序初始阶段，先于main函数的执行，所以可以利用这一点。在leetcode里经常见到利用一点，在main之前关闭cin与stdin的同步来“加快”速度的黑科技：
static int _ = []{
    cin.sync_with_stdio(false);
    return 0;
}();
//_attribute((constructor))是gcc扩展，标记这个函数应当在main函数之前执行。同样有一个__attribute((destructor))，标记函数应当在程序结束之前（main结束之后，或者调用了exit后）执行;
```

其实想一想 `main` 无非就是个入口点，只不过是更改入口点而已。



### typedef 关键字[wiki](<https://zh.wikipedia.org/wiki/Typedef>)

> 在C和C++编程语言中，typedef是一个关键字。它用来对一个数据类型取一个别名，目的是为了使源代码更易于阅读和理解。它通常用于简化声明复杂的类型组成的结构 ，但它也常常在各种长度的整数数据类型中看到，例如size_t和time_t。

typedef的语法是 : 

```c
typedef typedeclaration;
```

#### 和结构体一起使用

```c
typedef struct Node Node;
struct Node {
    int data;
    Node *nextptr;
};
```

#### 和指针一起使用

```c
typedef int *intptr;

intptr cliff, allen;        // both cliff and allen are int* type

intptr cliff2, *allen2;     // cliff2 is int* type, but allen2 is int** type
                            // same as: intptr cliff2;
                            //          intptr *allen2;
```

#### 和结构体指针一起使用

```c
typedef struct Node Node;
struct Node {
    int data;
    Node *nextptr;
};
```

#### 和函数指针一起使用

先来看这段没有使用typedef的代码：

```c
int do_math(float arg1, int arg2) {
    return arg2;
}

int call_a_func(int (*call_this)(float, int)) {
    int output = call_this(5.5, 7);
    return output;
}

int final_result = call_a_func(&do_math);
```

注意：这里的call_this是指向参数类型为(float, int) ,返回值是int类型的函数指针，另外注意函数指针的用法，

使用typedef后这段代码可以改写为：

```c
typedef int (*MathFunc)(float, int);

int do_math(float arg1, int arg2) {
    return arg2;
}

int call_a_func(MathFunc call_this) {
    int output = call_this(5.5, 7);
    return output;
}

int final_result = call_a_func(&do_math);
```

**前加一个typedef关键字，这样就定义一个名为MathFunc的函数指针类型，而不是一个MathFunc变量。**

### 指针

#### 什么是指针？

我们指知道：C语言中的数组是指 一类 类型，数组具体区分为  int 类型数组，double类型数组,char数组 等等。同样指针 这个概念也泛指 一类 数据类型，int指针类型，double指针类型，char指针类型等等。

通常，我们用int类型保存一些整型的数据，如 int num = 97 ， 我们也会用char来存储字符： char ch = 'a'。

我们也必须知道：任何程序数据载入内存后，在内存都有他们的地址，这就是指针。而为了保存一个数据在内存中的地址，我们就需要指针变量。

因此：**指针是程序数据在内存中的地址，而指针变量是用来保存这些地址的变量。**

指针本身也是一种数据类型



#### 为什么需要指针？

指针解决了一些编程中基本的问题。

第一，指针的使用使得不同区域的代码可以轻易的共享内存数据。当然你也可以通过数据的复制达到相同的效果，但是这样往往效率不太好，因为诸如结构体等大型数据，占用的字节数多，复制很消耗性能。但使用指针就可以很好的避免这个问题，因为任何类型的指针占用的字节数都是一样的（根据平台不同，有4字节或者8字节或者其他可能）。

 

第二，指针使得一些复杂的链接性的数据结构的构建成为可能，比如链表，链式二叉树等等。

 

第三，有些操作必须使用指针。如操作申请的堆内存。还有：C语言中的一切函数调用中，值传递都是“按值传递(pass by value)”的，如果我们要在函数中修改被传递过来的对象，就必须通过这个对象的指针来完成。



### 什么是指针变量？

**指针变量是用来存放指针(地址)的变量。** 

```c
int c = 76;
int *pointer; //此处int是指针变量的基类型，基类型就是指针变量指向的变量的类型
pointer = &c;

//将变量c的地址赋值给指针变量pointer
//赋值后，称指针变量pointer指向了变量c
```

指针运算符 *

取址运算符&

**指针变量也是变量，是变量就有地址** 



### 关于空指针

**void\*类型指针** 

由于void是空类型，因此void*类型的指针只保存了指针的值，而丢失了类型信息，我们不知道他指向的数据是什么类型的，只指定这个数据在内存中的起始地址，如果想要完整的提取指向的数据，程序员就必须对这个指针做出正确的类型转换，然后再解指针。因为，编译器不允许直接对void*类型的指针做解指针操作。

## 函数指针的几个疑惑

### 问题：c语言中， 函数名也称为函数的指针，那函数名是否也占内存空间？

> 首先你上面的话是错误的，函数名是一段指令的入口地址，它是地址常量，不占用内存空间，只是在编译阶段存在于编译器的符号表中，例如函数的入口地址是0x123456，在翻译成[机器指令](https://www.baidu.com/s?wd=%E6%9C%BA%E5%99%A8%E6%8C%87%E4%BB%A4&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao)以后，函数名是不存在的其在本质上对应汇编上的jump指令，在执行函数的时候，跳转到0x123456，这个函数名的本质就是这个地址。

c语言中其他变量的原理也都是类似的

```c++
#include <iostream>
using namespace std;
typedef int (*funcptr)(int, int);
int add(int a,int b){
    return a+b;
}
int test(funcptr ptr,int x, int y){
    cout<<"this is a test";
    return ptr(x, y);
}
int main(){
    cout<<test(add,2,3)<<endl;
    cout<<test(&add,3,4)<<endl;
    cout<<&main;
    return 0;
}
```



1）其实，MyFun的函数名与FunP函数指针都是一样的，即都是函数指针。MyFun函数名是一个函数指针常量，而FunP是一个函数数指针变量，这是它们的关系。 

2）但函数名调用如果都得如(*MyFun)(10)这样，那书写与读起来都是不方便和不习惯的。所以C语言的设计者们才会设计成又可允许MyFun(10)这种形式地调用（这样方便多了并与数学中的函数形式一样，不是吗？）。 

3）为统一起见，FunP函数指针变量也可以FunP(10)的形式来调用。

4）赋值时，即可FunP = &MyFun形式，也可FunP = MyFun。

### C++的左值与右值

#### 基本概念

左值与右值的概念在很多地方比较模糊，但其对我们对C++的理解很重要。比如我们看github上的源码的时候会看到std::move等用法，在查找其含义之后得知它功能是将左值转成右值引用，若是我们不理解左值与右值，还是无法知道它到底有什么用。

我们还会经常在编译错误和警告信息中看到左值右值概念的出现。

#### 左值与右值的简单定义

lvalue(locator value), 即左值，代表一个在内存中占有确定位置的对象，换句话说就是有一个地址。

rvalue：一个表达式要么是lvalue，要么是rvalue。所以，不是lvalue的表达式就是rvalue。

左值是指表达式结束后依然存在的持久对象，右值是指表达式结束时就不再存在的**临时对象**。一个区分左值与右值的便捷方法是：看能不能对表达式取地址，如果能，则为左值，否则为右值。

#### C++ 11中用&表示左值引用，用&&表示右值引用

```cpp
// Big Block
// https://www.nowcoder.com/discuss/418915

#include <string>
#include <iostream>
using namespace std;

int main() {
    {
        std::string s = "1234";
        cout << s << endl; // "1234"
    }
    {
        std::string s = "1234";
        std::move(s);
        cout << s << endl; // "1234"
    }
    {
        std::string s = "1234";
        const auto& s1 = std::move(s);
        cout << s << ' ' << s1 << endl; // "1234 1234"
    }
    {
        std::string s = "1234";
        auto&& s1 = std::move(s);
        cout << s << ' ' << s1 << endl; // "1234 1234"
    }
 
    {
        std::string s = "1234";
        auto s1 = std::move(s);
        cout << s << ' ' << s1 << endl;  // " 1234"
 
    }
 
    return 0;
}
```


### C++迭代器

```c
#include <vector>
#include <iostream>
using namespace std;

int main(){
    vector<int> v1;
    for(int i=0;i<100;i++){
        if(i%3 ==0)
            v1.push_back(i);
    }
    vector<int>::iterator it;
    for(vector<int>::iterator it=v1.begin(); it != v1.end();it++){
        *it += 2;
        cout<<*it<<endl;
        
    }
    return 0;
}

```

注意迭代器的用法

::不要丢掉，否则语法错误；迭代器的本质是指针，指针在使用之前一定要赋值

### 小知识

1. c语言print()函数的参数
   1. %d        --------dicimal(base 10)
   2. %x         --------hexadecimat(base 16)
   3. %o         --------octal(base 8)