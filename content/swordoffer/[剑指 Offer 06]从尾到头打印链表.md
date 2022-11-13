---
title: "[剑指 Offer 06]从尾到头打印链表"
date: 2021-02-18 11:29:03+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。 
//
// 
//
// 示例 1： 
//
// 输入：head = [1,3,2]
//输出：[2,3,1] 
//
// 
//
// 限制： 
//
// 0 <= 链表长度 <= 10000 
// Related Topics 链表 
// 👍 100 👎 0

/*
* 剑指 Offer 06 从尾到头打印链表
* 2021-02-18 11:29:03
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    vector<int> reversePrint(ListNode* head) {
        vector<int> ans;

        ListNode* p = head;
        while(p){
            ans.push_back(p->val);
            p = p->next;
        }

        return vector<int>(ans.rbegin(), ans.rend());
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
