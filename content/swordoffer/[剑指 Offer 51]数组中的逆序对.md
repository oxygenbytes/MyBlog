---
title: "[剑指 Offer 51]数组中的逆序对"
date: 2021-02-18 11:43:30+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。 
//
// 
//
// 示例 1: 
//
// 输入: [7,5,6,4]
//输出: 5 
//
// 
//
// 限制： 
//
// 0 <= 数组长度 <= 50000 
// 👍 316 👎 0

/*
* 剑指 Offer 51 数组中的逆序对
* 2021-02-18 11:43:30
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int reversePairs(vector<int>& nums) {

        int result = merge(nums, 0, nums.size() - 1);
        // for(auto x :  nums) cout<<x<<" ";
        return result;
    }
    int merge(vector<int>& nums ,int left, int right){
        if(left >= right) return 0;

        vector<int> temp;
        int mid = left + right >> 1;
        int i = left, j = mid + 1;
        int res = merge(nums ,left, mid) + merge(nums, mid + 1, right);
        while(i <= mid && j <= right){
            if(nums[i] <= nums[j]) temp.push_back(nums[i++]);
            else {
                temp.push_back(nums[j++]);
                res += mid - i + 1;
            }
        }
        while(i <= mid) temp.push_back(nums[i++]);
        while(j <= right) temp.push_back(nums[j++]);
        i = left;
        for(auto x : temp){
            nums[i++] = x;
        }
        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
