---
title: "[剑指 Offer 21]调整数组顺序使奇数位于偶数前面"
date: 2021-02-18 11:34:00+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。 
//
// 
//
// 示例： 
//
// 输入：nums = [1,2,3,4]
//输出：[1,3,2,4] 
//注：[3,1,2,4] 也是正确的答案之一。 
//
// 
//
// 提示： 
//
// 
// 1 <= nums.length <= 50000 
// 1 <= nums[i] <= 10000 
// 
// 👍 81 👎 0

/*
* 剑指 Offer 21 调整数组顺序使奇数位于偶数前面
* 2021-02-18 11:34:00
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> exchange(vector<int>& nums) {
        int n = nums.size();

        int i = 0, j = nums.size() - 1;
        while(i < j){
            while(i < nums.size() && nums[i] % 2 == 1) i++;
            while(j >= 0 && nums[j] % 2 == 0) j--;
            if(i < j) swap(nums[i], nums[j]);
        }
        return nums;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
