---
title: "[剑指 Offer 59 - II]队列的最大值"
date: 2021-02-18 11:47:07+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请定义一个队列并实现函数 max_value 得到队列里的最大值，要求函数max_value、push_back 和 pop_front 的均摊时间复杂度都
//是O(1)。 
//
// 若队列为空，pop_front 和 max_value 需要返回 -1 
//
// 示例 1： 
//
// 输入: 
//["MaxQueue","push_back","push_back","max_value","pop_front","max_value"]
//[[],[1],[2],[],[],[]]
//输出: [null,null,null,2,1,2]
// 
//
// 示例 2： 
//
// 输入: 
//["MaxQueue","pop_front","max_value"]
//[[],[],[]]
//输出: [null,-1,-1]
// 
//
// 
//
// 限制： 
//
// 
// 1 <= push_back,pop_front,max_value的总操作数 <= 10000 
// 1 <= value <= 10^5 
// 
// Related Topics 栈 Sliding Window 
// 👍 195 👎 0

/*
* 剑指 Offer 59 - II 队列的最大值
* 2021-02-18 11:47:07
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class MaxQueue {
public:
    queue<int> q;
    deque<int> dq;

    MaxQueue() {

    }

    int max_value() {
        if(dq.empty()) return -1;
        else return dq.front();
    }

    void push_back(int value) {
        q.push(value);
        while(!dq.empty() && dq.back() < value){
            dq.pop_back();
        }
        dq.push_back(value);
    }

    int pop_front() {
        int t = -1;
        if(!q.empty()) t = q.front(), q.pop();
        if(!dq.empty() && dq.front() == t) dq.pop_front();
        return t;
    }
};

/**
 * Your MaxQueue object will be instantiated and called as such:
 * MaxQueue* obj = new MaxQueue();
 * int param_1 = obj->max_value();
 * obj->push_back(value);
 * int param_3 = obj->pop_front();
 */
//leetcode submit region end(Prohibit modification and deletion)
     
```
