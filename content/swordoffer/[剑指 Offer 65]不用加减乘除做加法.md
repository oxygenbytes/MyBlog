---
title: "[剑指 Offer 65]不用加减乘除做加法"
date: 2021-02-18 11:48:18+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。 
//
// 
//
// 示例: 
//
// 输入: a = 1, b = 1
//输出: 2 
//
// 
//
// 提示： 
//
// 
// a, b 均可能是负数或 0 
// 结果不会溢出 32 位整数 
// 
// 👍 117 👎 0

/*
* 剑指 Offer 65 不用加减乘除做加法
* 2021-02-18 11:48:18
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int add(int a, int b) {
        int result = 0;
        int carry = 0;
        // + is not allowed to use
        // a + b == result + carry , so if b == 0, a is the ans;
        while(b){
            result = a ^ b;
            // [ref]:https://www.cnblogs.com/grandyang/p/5631814.html
            carry = (a & b & 0x7fffffff) << 1; // LeetCode 自己的编译器比较 strict，不能对负数进行左移，就是说最高位符号位必须要为0，才能左移
            a = result;
            b = carry;
        }
        return a;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
