---
title: "[剑指 Offer 17]打印从1到最大的n位数"
date: 2021-02-18 11:32:29+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。 
//
// 示例 1: 
//
// 输入: n = 1
//输出: [1,2,3,4,5,6,7,8,9]
// 
//
// 
//
// 说明： 
//
// 
// 用返回一个整数列表来代替打印 
// n 为正整数 
// 
// Related Topics 数学 
// 👍 82 👎 0

/*
* 剑指 Offer 17 打印从1到最大的n位数
* 2021-02-18 11:32:29
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> printNumbers(int n) {
        vector<int> ans;
        int pos = 1;
        for(int i = 1;i <= n;i++)
            pos *= 10;
        for(int i = 1;i < pos;i++)
            ans.push_back(i);
        return ans;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
