---
title: "[剑指 Offer 43]1～n 整数中 1 出现的次数"
date: 2021-02-18 11:41:34+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个整数 n ，求1～n这n个整数的十进制表示中1出现的次数。 
//
// 例如，输入12，1～12这些整数中包含1 的数字有1、10、11和12，1一共出现了5次。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 12
//输出：5
// 
//
// 示例 2： 
//
// 
//输入：n = 13
//输出：6 
//
// 
//
// 限制： 
//
// 
// 1 <= n < 2^31 
// 
//
// 注意：本题与主站 233 题相同：https://leetcode-cn.com/problems/number-of-digit-one/ 
// Related Topics 数学 
// 👍 129 👎 0

/*
* 剑指 Offer 43 1～n 整数中 1 出现的次数
* 2021-02-18 11:41:34
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int countDigitOne(int n) {
        vector<int> number;
        while(n) number.push_back(n % 10), n /= 10;
        //ab*c*def left=>ab right=>def t = power(10,c)
        // 0-(ab-1) c=1 t  ans += ab * t
        // ab 1. c = 0 ab * t ans += 0
        //    2. c = 1 def ans += def
        //    3. c = 2 t ans += t
        int ans = 0;
        for(int i = number.size() - 1;i >= 0;i--){
            int left = 0, right = 0, t =1;
            for(int j = number.size() - 1;j > i;j--) left = left * 10 + number[j];
            for(int j = i - 1;j >= 0;j--) right = right * 10 + number[j], t *= 10;
            ans += t * left;
            if(number[i] == 1) ans += right + 1;
            if(number[i] > 1) ans += t;
        }
        return ans;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
