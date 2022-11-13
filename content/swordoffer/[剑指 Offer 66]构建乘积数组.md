---
title: "[剑指 Offer 66]构建乘积数组"
date: 2021-02-18 11:48:44+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//给定一个数组 A[0,1,…,n-1]，请构建一个数组 B[0,1,…,n-1]，其中 B[i] 的值是数组 A 中除了下标 i 以外的元素的积, 即 B[
//i]=A[0]×A[1]×…×A[i-1]×A[i+1]×…×A[n-1]。不能使用除法。 
//
// 
//
// 示例: 
//
// 
//输入: [1,2,3,4,5]
//输出: [120,60,40,30,24] 
//
// 
//
// 提示： 
//
// 
// 所有元素乘积之和不会溢出 32 位整数 
// a.length <= 100000 
// 
// 👍 79 👎 0

/*
* 剑指 Offer 66 构建乘积数组
* 2021-02-18 11:48:44
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> constructArr(vector<int>& a) {
        if(a.size() == 0) return {};

        vector<int> ans(a.size(), 0);

        ans[0] = 1;

        for(int i = 1, mult = a[0];i < a.size();i++){
            ans[i] = mult;
            mult *= a[i];
        }

        for(int i = a.size() - 2, mult = a[a.size()-1];i >= 0;i--){
            ans[i] *= mult;
            mult *= a[i];
        }

        return ans;

    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
