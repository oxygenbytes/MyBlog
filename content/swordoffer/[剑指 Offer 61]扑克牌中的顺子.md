---
title: "[剑指 Offer 61]扑克牌中的顺子"
date: 2021-02-18 11:47:36+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。2～10为数字本身，A为1，J为11，Q为12，K为13，而大、小王为 0 ，可以看成任
//意数字。A 不能视为 14。 
//
// 
//
// 示例 1: 
//
// 输入: [1,2,3,4,5]
//输出: True 
//
// 
//
// 示例 2: 
//
// 输入: [0,0,1,2,5]
//输出: True 
//
// 
//
// 限制： 
//
// 数组长度为 5 
//
// 数组的数取值为 [0, 13] . 
// 👍 95 👎 0

/*
* 剑指 Offer 61 扑克牌中的顺子
* 2021-02-18 11:47:36
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    bool isStraight(vector<int>& nums) {
        if(nums.size() != 5) return false;

        sort(nums.begin(), nums.end());

        int k = 0;
        while(!nums[k]) k++;
        for(int i = k + 1; i < 5;i++){
            if(nums[i] == nums[i-1]) return false;
        }
        return nums[4] - nums[k] <= 4;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
