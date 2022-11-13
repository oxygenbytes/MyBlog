---
title: "[剑指 Offer 39]数组中出现次数超过一半的数字"
date: 2021-02-18 11:40:33+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。 
//
// 
//
// 你可以假设数组是非空的，并且给定的数组总是存在多数元素。 
//
// 
//
// 示例 1: 
//
// 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
//输出: 2 
//
// 
//
// 限制： 
//
// 1 <= 数组长度 <= 50000 
//
// 
//
// 注意：本题与主站 169 题相同：https://leetcode-cn.com/problems/majority-element/ 
//
// 
// Related Topics 位运算 分治算法 
// 👍 111 👎 0

/*
* 剑指 Offer 39 数组中出现次数超过一半的数字
* 2021-02-18 11:40:33
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int majorityElement(vector<int>& nums) {
        int res = nums[0];
        int freq = 0;

        for(int i = 1;i < nums.size();i++){
            if(nums[i] == res){
                freq++;
            }else{
                if(freq == 0){
                    res = nums[i];
                }else{
                    freq--;
                }
            }
        }
        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
