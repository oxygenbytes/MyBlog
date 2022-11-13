---
title: "[剑指 Offer 45]把数组排成最小的数"
date: 2021-02-18 11:42:05+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个非负整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。 
//
// 
//
// 示例 1: 
//
// 输入: [10,2]
//输出: "102" 
//
// 示例 2: 
//
// 输入: [3,30,34,5,9]
//输出: "3033459" 
//
// 
//
// 提示: 
//
// 
// 0 < nums.length <= 100 
// 
//
// 说明: 
//
// 
// 输出结果可能非常大，所以你需要返回一个字符串而不是整数 
// 拼接起来的数字可能会有前导 0，最后结果不需要去掉前导 0 
// 
// Related Topics 排序 
// 👍 158 👎 0

/*
* 剑指 Offer 45 把数组排成最小的数
* 2021-02-18 11:42:05
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    string minNumber(vector<int>& nums) {
        sort(nums.begin(), nums.end(), cmp);
        string res;
        for(auto x : nums) res += to_string(x);
        return res;
    }
    static bool cmp(int a, int b){
        auto as = to_string(a), bs = to_string(b);
        return as + bs < bs + as;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
