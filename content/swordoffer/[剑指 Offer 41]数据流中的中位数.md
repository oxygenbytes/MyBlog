---
title: "[剑指 Offer 41]数据流中的中位数"
date: 2021-02-18 11:41:00+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数
//值排序之后中间两个数的平均值。 
//
// 例如， 
//
// [2,3,4] 的中位数是 3 
//
// [2,3] 的中位数是 (2 + 3) / 2 = 2.5 
//
// 设计一个支持以下两种操作的数据结构： 
//
// 
// void addNum(int num) - 从数据流中添加一个整数到数据结构中。 
// double findMedian() - 返回目前所有元素的中位数。 
// 
//
// 示例 1： 
//
// 输入：
//["MedianFinder","addNum","addNum","findMedian","addNum","findMedian"]
//[[],[1],[2],[],[3],[]]
//输出：[null,null,null,1.50000,null,2.00000]
// 
//
// 示例 2： 
//
// 输入：
//["MedianFinder","addNum","findMedian","addNum","findMedian"]
//[[],[2],[],[3],[]]
//输出：[null,null,2.00000,null,2.50000] 
//
// 
//
// 限制： 
//
// 
// 最多会对 addNum、findMedian 进行 50000 次调用。 
// 
//
// 注意：本题与主站 295 题相同：https://leetcode-cn.com/problems/find-median-from-data-strea
//m/ 
// Related Topics 堆 设计 
// 👍 101 👎 0

/*
* 剑指 Offer 41 数据流中的中位数
* 2021-02-18 11:41:00
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class MedianFinder {
public:
    priority_queue<int> maxHeap;
    priority_queue<int ,vector<int>, greater<int>> minHeap;

    /** initialize your data structure here. */
    MedianFinder() {

    }

    void addNum(int num) {
        minHeap.push(num);

        if(minHeap.size() > maxHeap.size()  + 1){
            maxHeap.push(minHeap.top());
            minHeap.pop();
        }

        if(maxHeap.size() && maxHeap.top() > minHeap.top()){
            int m = maxHeap.top();
            int n = minHeap.top();

            minHeap.pop();
            minHeap.push(m);
            maxHeap.pop();
            maxHeap.push(n);

        }
    }

    double findMedian() {
        int m = maxHeap.size();
        int n = minHeap.size();

        if(m + n & 1) return minHeap.top();
        else return (maxHeap.top() + minHeap.top()) / 2.0;
    }
};

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder* obj = new MedianFinder();
 * obj->addNum(num);
 * double param_2 = obj->findMedian();
 */
//leetcode submit region end(Prohibit modification and deletion)
     
```
