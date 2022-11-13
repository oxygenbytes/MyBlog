---
title: "[剑指 Offer 09]用两个栈实现队列"
date: 2021-02-18 11:29:45+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的
//功能。(若队列中没有元素，deleteHead 操作返回 -1 ) 
//
// 
//
// 示例 1： 
//
// 输入：
//["CQueue","appendTail","deleteHead","deleteHead"]
//[[],[3],[],[]]
//输出：[null,null,3,-1]
// 
//
// 示例 2： 
//
// 输入：
//["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
//[[],[],[5],[2],[],[]]
//输出：[null,-1,null,null,5,2]
// 
//
// 提示： 
//
// 
// 1 <= values <= 10000 
// 最多会对 appendTail、deleteHead 进行 10000 次调用 
// 
// Related Topics 栈 设计 
// 👍 177 👎 0

/*
* 剑指 Offer 09 用两个栈实现队列
* 2021-02-18 11:29:45
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class CQueue {
public:
    stack<int> stk;
    stack<int> cache;

    CQueue() {

    }
    void cp(stack<int>& a, stack<int>& b){
        while(a.size())
            b.push(a.top()),a.pop();
    }
    void appendTail(int value) {
        stk.push(value);
    }

    int deleteHead() {
        if(cache.empty() && stk.empty()) return -1;
        if(!cache.empty()){
            int result = cache.top();
            cache.pop();
            return result;
        }else{
            cp(stk, cache);
            int result = cache.top();
            cache.pop();
            return result;
        }

    }
};

/**
 * Your CQueue object will be instantiated and called as such:
 * CQueue* obj = new CQueue();
 * obj->appendTail(value);
 * int param_2 = obj->deleteHead();
 */
//leetcode submit region end(Prohibit modification and deletion)
     
```
