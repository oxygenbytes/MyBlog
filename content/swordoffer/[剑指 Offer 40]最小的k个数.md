---
title: "[剑指 Offer 40]最小的k个数"
date: 2021-02-18 11:40:47+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。 
//
// 
//
// 示例 1： 
//
// 输入：arr = [3,2,1], k = 2
//输出：[1,2] 或者 [2,1]
// 
//
// 示例 2： 
//
// 输入：arr = [0,1,2,1], k = 1
//输出：[0] 
//
// 
//
// 限制： 
//
// 
// 0 <= k <= arr.length <= 10000 
// 0 <= arr[i] <= 10000 
// 
// Related Topics 堆 分治算法 
// 👍 191 👎 0

/*
* 剑指 Offer 40 最小的k个数
* 2021-02-18 11:40:47
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        int n = arr.size();
        priority_queue<int, vector<int>, less<int>> pq;

        for(int i = 0;i < n;i++){
            if(pq.size() < k){
                pq.push(arr[i]);
            }else{
                if(pq.size() && pq.top() > arr[i]) pq.pop(), pq.push(arr[i]);
            }
        }
        vector<int> ans;
        while(pq.size()) ans.push_back(pq.top()), pq.pop();

        return ans;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
