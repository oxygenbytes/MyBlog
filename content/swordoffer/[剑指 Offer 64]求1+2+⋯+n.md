---
title: "[剑指 Offer 64]求1+2+…+n"
date: 2021-02-18 11:48:19+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。 
//
// 
//
// 示例 1： 
//
// 输入: n = 3
//输出: 6
// 
//
// 示例 2： 
//
// 输入: n = 9
//输出: 45
// 
//
// 
//
// 限制： 
//
// 
// 1 <= n <= 10000 
// 
// 👍 267 👎 0

/*
* 剑指 Offer 64 求1+2+…+n
* 2021-02-18 11:48:19
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int sumNums(int n) {
        if(n == 1) return 1;
        else return sumNums((n-1)) + n;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
