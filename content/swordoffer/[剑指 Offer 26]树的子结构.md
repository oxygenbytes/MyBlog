---
title: "[剑指 Offer 26]树的子结构"
date: 2021-02-18 11:35:04+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构) 
//
// B是A的子结构， 即 A中有出现和B相同的结构和节点值。 
//
// 例如: 
//给定的树 A: 
//
// 3 
// / \ 
// 4 5 
// / \ 
// 1 2 
//给定的树 B： 
//
// 4 
// / 
// 1 
//返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。 
//
// 示例 1： 
//
// 输入：A = [1,2,3], B = [3,1]
//输出：false
// 
//
// 示例 2： 
//
// 输入：A = [3,4,5,1,2], B = [4,1]
//输出：true 
//
// 限制： 
//
// 0 <= 节点个数 <= 10000 
// Related Topics 树 
// 👍 188 👎 0

/*
* 剑指 Offer 26 树的子结构
* 2021-02-18 11:35:04
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    bool isSubStructure(TreeNode* A, TreeNode* B) {
        if (!A || !B) return false;
        if(isPart(A, B)) return true;
        return isSubStructure(A->left, B) || isSubStructure(A->right, B);

    }
    bool isPart(TreeNode* a, TreeNode* b){
        if(!b) return true;
        if(!a) return false;
        if(a->val != b->val) return false;
        return isPart(a->left, b->left) && isPart(a->right, b->right);
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
