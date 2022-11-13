---
title: "[剑指 Offer 57]和为s的两个数字"
date: 2021-02-18 11:45:35+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。 
//
// 
//
// 示例 1： 
//
// 输入：nums = [2,7,11,15], target = 9
//输出：[2,7] 或者 [7,2]
// 
//
// 示例 2： 
//
// 输入：nums = [10,26,30,31,47,60], target = 40
//输出：[10,30] 或者 [30,10]
// 
//
// 
//
// 限制： 
//
// 
// 1 <= nums.length <= 10^5 
// 1 <= nums[i] <= 10^6 
// 
// 👍 72 👎 0

/*
* 剑指 Offer 57 和为s的两个数字
* 2021-02-18 11:45:35
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {

        for(int i = 0;i < nums.size();i++){
            if(nums[i] > target) continue;
            if(binarySearch(nums, target - nums[i])) return {nums[i], target - nums[i]};
        }
        return {};
    }
    bool binarySearch(vector<int>& nums, int target){
        int left = 0, right = nums.size() - 1;

        while(left < right){
            int mid = left + right >> 1;
            if(nums[mid] == target) return true;
            else if(nums[mid] < target) left = mid + 1;
            else right = mid;
        }
        return false;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
