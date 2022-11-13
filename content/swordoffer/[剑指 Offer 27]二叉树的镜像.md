---
title: "[剑指 Offer 27]二叉树的镜像"
date: 2021-02-18 11:35:20+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请完成一个函数，输入一个二叉树，该函数输出它的镜像。 
//
// 例如输入： 
//
// 4 
// / \ 
// 2 7 
// / \ / \ 
//1 3 6 9 
//镜像输出： 
//
// 4 
// / \ 
// 7 2 
// / \ / \ 
//9 6 3 1 
//
// 
//
// 示例 1： 
//
// 输入：root = [4,2,7,1,3,6,9]
//输出：[4,7,2,9,6,3,1]
// 
//
// 
//
// 限制： 
//
// 0 <= 节点个数 <= 1000 
//
// 注意：本题与主站 226 题相同：https://leetcode-cn.com/problems/invert-binary-tree/ 
// Related Topics 树 
// 👍 101 👎 0

/*
* 剑指 Offer 27 二叉树的镜像
* 2021-02-18 11:35:20
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
    TreeNode* mirrorTree(TreeNode* root) {
        if(!root) return nullptr;
        auto l = root->left;
        auto r = root->right;
        root->right = mirrorTree(l);
        root->left = mirrorTree(r);
        return root;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
