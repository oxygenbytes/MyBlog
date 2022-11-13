---
title: "[剑指 Offer 56 - I]数组中数字出现的次数"
date: 2021-02-18 11:45:07+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。 
//
// 
//
// 示例 1： 
//
// 输入：nums = [4,1,4,6]
//输出：[1,6] 或 [6,1]
// 
//
// 示例 2： 
//
// 输入：nums = [1,2,10,4,1,4,3,3]
//输出：[2,10] 或 [10,2] 
//
// 
//
// 限制： 
//
// 
// 2 <= nums.length <= 10000 
// 
//
// 
// 👍 301 👎 0

/*
* 剑指 Offer 56 - I 数组中数字出现的次数
* 2021-02-18 11:45:07
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
/*
    异或得到 x^y
    取 x与y中第k位为1的数
    将数分为两个集合，第k位为1的集合和第k位不是1的集合
    其中x y分别在这两个集合，且相同的元素是在同一个集合里面
    于是将其转化成了求重复数字中的单个数值的问题
 */
class Solution {
public:
    vector<int> singleNumbers(vector<int>& nums) {
        int sum = 0;
        for(auto x : nums) sum ^= x;

        int k = 0;
        while(!(sum >> k & 1)) k++;

        int first = 0;
        for(auto x : nums){
            if(x >> k & 1)
                first ^= x;
        }
        return vector<int>{first, first^sum};
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
