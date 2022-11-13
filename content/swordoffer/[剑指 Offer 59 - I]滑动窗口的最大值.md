---
title: "[剑指 Offer 59 - I]滑动窗口的最大值"
date: 2021-02-18 11:46:56+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。 
//
// 示例: 
//
// 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
//输出: [3,3,5,5,6,7] 
//解释: 
//
//  滑动窗口的位置                最大值
//---------------               -----
//[1  3  -1] -3  5  3  6  7       3
// 1 [3  -1  -3] 5  3  6  7       3
// 1  3 [-1  -3  5] 3  6  7       5
// 1  3  -1 [-3  5  3] 6  7       5
// 1  3  -1  -3 [5  3  6] 7       6
// 1  3  -1  -3  5 [3  6  7]      7 
//
// 
//
// 提示： 
//
// 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。 
//
// 注意：本题与主站 239 题相同：https://leetcode-cn.com/problems/sliding-window-maximum/ 
// Related Topics 队列 Sliding Window 
// 👍 186 👎 0

/*
* 剑指 Offer 59 - I 滑动窗口的最大值
* 2021-02-18 11:46:56
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        vector<int> res;
        deque<int> q; // which keep index

        for(int i = 0;i < nums.size();i++){
            while(q.size() && q.front() <= i - k) q.pop_front();// when out of windows
            while(q.size() && nums[q.back()] <= nums[i]) q.pop_back(); // when new element is big
            q.push_back(i); // push current index
            if(i >= k - 1) res.push_back(nums[q.front()]);
        }
        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
