---
title: "[剑指 Offer 46]把数字翻译成字符串"
date: 2021-02-18 11:42:18+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可
//能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。 
//
// 
//
// 示例 1: 
//
// 输入: 12258
//输出: 5
//解释: 12258有5种不同的翻译，分别是"bccfi", "bwfi", "bczi", "mcfi"和"mzi" 
//
// 
//
// 提示： 
//
// 
// 0 <= num < 231 
// 
// 👍 183 👎 0

/*
* 剑指 Offer 46 把数字翻译成字符串
* 2021-02-18 11:42:18
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int translateNum(int num) {
        string str = to_string(num);
        int n = str.size();

        vector<int> dp(n+1, 0);
        dp[0] = 1;
        dp[1] = 1;

        for(int i = 2;i <= n;i++){
            dp[i] = dp[i-1];
            int t = str[i-1] - '0' + (str[i-2] - '0') * 10;
            if(t >= 10 && t <= 25) dp[i] += dp[i-2];
        }
        return dp[n];
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
