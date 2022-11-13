---
title: "[剑指 Offer 53 - I]在排序数组中查找数字 I"
date: 2021-02-18 11:44:07+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//统计一个数字在排序数组中出现的次数。 
//
// 
//
// 示例 1: 
//
// 输入: nums = [5,7,7,8,8,10], target = 8
//输出: 2 
//
// 示例 2: 
//
// 输入: nums = [5,7,7,8,8,10], target = 6
//输出: 0 
//
// 
//
// 限制： 
//
// 0 <= 数组长度 <= 50000 
//
// 
//
// 注意：本题与主站 34 题相同（仅返回值不同）：https://leetcode-cn.com/problems/find-first-and-last-
//position-of-element-in-sorted-array/ 
// Related Topics 数组 二分查找 
// 👍 93 👎 0

/*
* 剑指 Offer 53 - I 在排序数组中查找数字 I
* 2021-02-18 11:44:07
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int search(vector<int>& nums, int target) {
        if(nums.size() == 0) return 0;

        int left = 0, right = nums.size() - 1;

        while(left < right){
            int mid = left + right >> 1;
            if(target <= nums[mid]) right = mid;
            else left = mid + 1;
        }
        int temp = left;

        left = 0, right = nums.size() - 1;
        while(left < right){
            int mid = 1 + left + right >> 1;
            if(target >= nums[mid]) left = mid;
            else right = mid - 1;
        }

        if(nums[temp] != target) return 0;
        return right - temp + 1;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
