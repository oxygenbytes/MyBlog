---
title: "[剑指 Offer 35]复杂链表的复制"
date: 2021-02-18 11:38:35+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请实现 copyRandomList 函数，复制一个复杂链表。在复杂链表中，每个节点除了有一个 next 指针指向下一个节点，还有一个 random 指针指
//向链表中的任意节点或者 null。 
//
// 
//
// 示例 1： 
//
// 
//
// 输入：head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
//输出：[[7,null],[13,0],[11,4],[10,2],[1,0]]
// 
//
// 示例 2： 
//
// 
//
// 输入：head = [[1,1],[2,1]]
//输出：[[1,1],[2,1]]
// 
//
// 示例 3： 
//
// 
//
// 输入：head = [[3,null],[3,0],[3,null]]
//输出：[[3,null],[3,0],[3,null]]
// 
//
// 示例 4： 
//
// 输入：head = []
//输出：[]
//解释：给定的链表为空（空指针），因此返回 null。
// 
//
// 
//
// 提示： 
//
// 
// -10000 <= Node.val <= 10000 
// Node.random 为空（null）或指向链表中的节点。 
// 节点数目不超过 1000 。 
// 
//
// 
//
// 注意：本题与主站 138 题相同：https://leetcode-cn.com/problems/copy-list-with-random-point
//er/ 
//
// 
// Related Topics 链表 
// 👍 144 👎 0

/*
* 剑指 Offer 35 复杂链表的复制
* 2021-02-18 11:38:35
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
/*
// Definition for a Node.
class Node {
public:
    int val;
    Node* next;
    Node* random;
    
    Node(int _val) {
        val = _val;
        next = NULL;
        random = NULL;
    }
};
*/
class Solution {
public:
    Node* copyRandomList(Node* head) {
        if(!head) return nullptr;

        auto p = head;
        Node* q;

        while(p){
            q = p->next;
            p->next = new Node(p->val);
            p->next->next =q;
            p = q;
        }

        Node* cp = nullptr;
        p = head;

        while(p){
            cp = p->next;
            q = p->next->next;
            cp->random = p->random ? p->random->next : nullptr;
            p = q;
        }

        Node* res = head->next;
        p = head;

        while(p){
            cp = p->next;
            q = p->next->next;
            p->next = q;
            cp->next = q ? q->next : nullptr;
            p = q;
        }

        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
