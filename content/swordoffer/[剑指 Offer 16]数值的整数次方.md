---
title: "[剑指 Offer 16]数值的整数次方"
date: 2021-02-18 11:32:22+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//实现函数double Power(double base, int exponent)，求base的exponent次方。不得使用库函数，同时不需要考虑大数
//问题。 
//
// 
//
// 示例 1: 
//
// 输入: 2.00000, 10
//输出: 1024.00000
// 
//
// 示例 2: 
//
// 输入: 2.10000, 3
//输出: 9.26100
// 
//
// 示例 3: 
//
// 输入: 2.00000, -2
//输出: 0.25000
//解释: 2-2 = 1/22 = 1/4 = 0.25 
//
// 
//
// 说明: 
//
// 
// -100.0 < x < 100.0 
// n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。 
// 
//
// 注意：本题与主站 50 题相同：https://leetcode-cn.com/problems/powx-n/ 
// Related Topics 递归 
// 👍 118 👎 0

/*
* 剑指 Offer 16 数值的整数次方
* 2021-02-18 11:32:22
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    double myPow(double x, int n) {
        double ans = 1;
        long long b = abs(n);
        while(b){
            if(b & 1) ans = ans * x;
            x = x * x;
            b >>= 1;
        }
        if(n < 0) ans = 1 / ans;
        return ans;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
