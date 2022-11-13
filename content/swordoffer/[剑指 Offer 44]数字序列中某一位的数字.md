---
title: "[剑指 Offer 44]数字序列中某一位的数字"
date: 2021-02-18 11:41:52+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，
//等等。 
//
// 请写一个函数，求任意第n位对应的数字。 
//
// 
//
// 示例 1： 
//
// 输入：n = 3
//输出：3
// 
//
// 示例 2： 
//
// 输入：n = 11
//输出：0 
//
// 
//
// 限制： 
//
// 
// 0 <= n < 2^31 
// 
//
// 注意：本题与主站 400 题相同：https://leetcode-cn.com/problems/nth-digit/ 
// Related Topics 数学 
// 👍 86 👎 0

/*
* 剑指 Offer 44 数字序列中某一位的数字
* 2021-02-18 11:41:52
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int findNthDigit(int n) {
        int digit = 1;
        long long s = 9, base = 1;

        while(n > digit * s) {
            n -= digit * s;
            digit++;
            s *= 10;
            base *= 10;
            // cout<<digit<<" "<<s<<" "<<base<<endl;
        }

        int number = base + (n-1) / digit;
        int r = n % digit ? n % digit : digit;
        //cout<<number<<endl;
        for(int j = 0;j < digit - r;j++) number /= 10;
        return number % 10;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
