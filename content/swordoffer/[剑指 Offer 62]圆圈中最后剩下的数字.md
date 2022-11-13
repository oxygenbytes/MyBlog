---
title: "[剑指 Offer 62]圆圈中最后剩下的数字"
date: 2021-02-18 11:47:52+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//0,1,···,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字（删除后从下一个数字开始计数）。求出这个圆圈里剩下的最后一个数字。
// 
//
// 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。 
//
// 
//
// 示例 1： 
//
// 
//输入: n = 5, m = 3
//输出: 3
// 
//
// 示例 2： 
//
// 
//输入: n = 10, m = 17
//输出: 2
// 
//
// 
//
// 限制： 
//
// 
// 1 <= n <= 10^5 
// 1 <= m <= 10^6 
// 
// 👍 294 👎 0

/*
* 剑指 Offer 62 圆圈中最后剩下的数字
* 2021-02-18 11:47:52
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int lastRemaining(int n, int m) {
        if(!n) return 0;
        return (lastRemaining(n-1, m) + m) % n;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
