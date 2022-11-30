---
title: "C++输入输出"
date: 2019-06-27T09:06:27+08:00
draft: false
toc: false
images:
tags:
  - C++
---

## 使用cin来读取数据

​cin 基本用法

​cin遇到缓冲区中的[enter],[space],[tab]会结束当前输入，并舍弃[enter],[space],[tab]，继续下一项输入，当有连续[space],[enter,[tab]会全部舍弃。

## 使用getchar()来输入字符

```c++
#include <bits/stdc++.h>
using namespace std;
int main(){
    char c;
    cout<<"enter a sentence:"<<endl;
    while(c=getchar())
        cout<<c;
    return 0;
}
```

getchar不跳过任何字符，包括终止字符Ctrl + D，严格按照函数个数读入字符

## 使用cin.get()输入字符

```c++
#include <bits/stdc++.h>
using namespace std;
int main(){
    char c;
    cout<<"enter a sentence:"<<endl;
    while((c=cin.get()) != EOF)
        cout<<c;
    return 0;
}
```

cin.get()会读取除了终止字符Ctrl + Z ，Ctrl + D外的任何字符

### 使用cin.get()读取字符串

```c++
cin.get(ch,10,'\n');
// 读取10-1个字符（包括空格），赋值给特定的字符数组
// 如果在读取10-1个字符之前，遇到制定的终止字符'\n',则提前停止读取
// 读取成功返回非0值（真），失败返回0值（假）
```

## 使用cin.getline()函数读入整行字符串

getline()和get()的区别

* getline遇到终止字符标志时结束，缓冲区文件指针移到终止字符之后

* get遇到终止字符后停止读取，缓冲区文件指针不移动

  cin.get()	   --->  we are **f**amily;

  cin.getline()   --->   we are f**a**ily;

### 一个需要特别关注的程序

```c++
#include <bits/stdc++.h>
using namespace std;
int main(){
    char s[10][10];
    int n = 0;
    cin>>n;
    //cin.get(); 程序正常！
    for(int i = 0;i < n;i++){
        cin.getline(a[i],10);
    }
    for(int i = 0;i < n;i++){
        cout<<a[i]<<endl;
    }
    return 0;
}
3
sunday
monday
tuesday

sunday
monday //少了一行，因为n读入后的换行被cin.getline()读取了
```