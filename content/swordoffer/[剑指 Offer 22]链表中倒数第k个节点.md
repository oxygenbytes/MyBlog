---
title: "[剑指 Offer 22]链表中倒数第k个节点"
date: 2021-02-18 11:34:11+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。 
//
// 例如，一个链表有 6 个节点，从头节点开始，它们的值依次是 1、2、3、4、5、6。这个链表的倒数第 2 个节点是值为 4 的节点。 
//
// 
//
// 示例： 
//
// 
//给定一个链表: 1->2->3->4->5, 和 k = 2.
//
//返回链表 4->5. 
// Related Topics 链表 双指针 
// 👍 137 👎 0

/*
* 剑指 Offer 22 链表中倒数第k个节点
* 2021-02-18 11:34:11
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
    ListNode* getKthFromEnd(ListNode* head, int k) {
        if(!head) return nullptr;

        ListNode* pre = head;
        while(k--){
            if(pre) pre = pre->next;
            else return nullptr;
        }

        ListNode* cur = head;
        while(pre){
            cur = cur->next;
            pre = pre->next;
        }
        return cur;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
