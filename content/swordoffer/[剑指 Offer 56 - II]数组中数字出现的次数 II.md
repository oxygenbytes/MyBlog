---
title: "[剑指 Offer 56 - II]数组中数字出现的次数 II"
date: 2021-02-18 11:45:24+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。 
//
// 
//
// 示例 1： 
//
// 输入：nums = [3,4,3,3]
//输出：4
// 
//
// 示例 2： 
//
// 输入：nums = [9,1,7,9,7,9,7]
//输出：1 
//
// 
//
// 限制： 
//
// 
// 1 <= nums.length <= 10000 
// 1 <= nums[i] < 2^31 
// 
//
// 
// 👍 125 👎 0

/*
* 剑指 Offer 56 - II 数组中数字出现的次数 II
* 2021-02-18 11:45:24
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    // 看每一位1的数量
    int singleNumber(vector<int>& nums) {

        int ans = 0;
        for(int i = 31;i >= 0;i--){
            int cnt = 0;
            for(auto x : nums){
                if(x >> i & 1)
                    cnt++;
            }
            if(cnt % 3 == 1){
                ans = ans * 2 + 1;
            }else{
                ans = ans * 2;
            }
        }
        return ans;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
