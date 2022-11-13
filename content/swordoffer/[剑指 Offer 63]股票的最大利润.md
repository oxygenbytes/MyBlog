---
title: "[剑指 Offer 63]股票的最大利润"
date: 2021-02-18 11:48:08+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖该股票一次可能获得的最大利润是多少？ 
//
// 
//
// 示例 1: 
//
// 输入: [7,1,5,3,6,4]
//输出: 5
//解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
// 
//
// 示例 2: 
//
// 输入: [7,6,4,3,1]
//输出: 0
//解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。 
//
// 
//
// 限制： 
//
// 0 <= 数组长度 <= 10^5 
//
// 
//
// 注意：本题与主站 121 题相同：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-s
//tock/ 
// Related Topics 动态规划 
// 👍 91 👎 0

/*
* 剑指 Offer 63 股票的最大利润
* 2021-02-18 11:48:08
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int n = prices.size();
        if(n == 0) return 0;
        int res = 0;
        // use minv to keep the min value
        for(int i = 0, minv = prices[0];i < n;i++){
            res = max(res, prices[i] - minv);
            if(minv > prices[i]) minv = prices[i];
        }
        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
