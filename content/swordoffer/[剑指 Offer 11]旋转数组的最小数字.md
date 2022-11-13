---
title: "[剑指 Offer 11]旋转数组的最小数字"
date: 2021-02-18 11:30:29+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如，数组 [3,4,5,1,2
//] 为 [1,2,3,4,5] 的一个旋转，该数组的最小值为1。 
//
// 示例 1： 
//
// 输入：[3,4,5,1,2]
//输出：1
// 
//
// 示例 2： 
//
// 输入：[2,2,2,0,1]
//输出：0
// 
//
// 注意：本题与主站 154 题相同：https://leetcode-cn.com/problems/find-minimum-in-rotated-sor
//ted-array-ii/ 
// Related Topics 二分查找 
// 👍 230 👎 0

/*
* 剑指 Offer 11 旋转数组的最小数字
* 2021-02-18 11:30:29
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int minArray(vector<int>& numbers) {
        int k = numbers.size() - 1;

        while(k > 0 && numbers[k] == numbers[0]) k--; // 去尾
        if(numbers[k] >= numbers[0]) return numbers[0];

        int left = 0, right = k;

        while(left < right){ // 二分
            int mid = (left + right) >> 1;
            if(numbers[mid] < numbers[0]) right = mid;
            else left = mid + 1;
        }
        return numbers[right];
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
