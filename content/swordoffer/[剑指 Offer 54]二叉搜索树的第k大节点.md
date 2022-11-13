---
title: "[剑指 Offer 54]二叉搜索树的第k大节点"
date: 2021-02-18 11:44:28+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//给定一棵二叉搜索树，请找出其中第k大的节点。 
//
// 
//
// 示例 1: 
//
// 输入: root = [3,1,4,null,2], k = 1
//   3
//  / \
// 1   4
//  \
//   2
//输出: 4 
//
// 示例 2: 
//
// 输入: root = [5,3,6,2,4,null,null,1], k = 3
//       5
//      / \
//     3   6
//    / \
//   2   4
//  /
// 1
//输出: 4 
//
// 
//
// 限制： 
//
// 1 ≤ k ≤ 二叉搜索树元素个数 
// Related Topics 树 
// 👍 118 👎 0

/*
* 剑指 Offer 54 二叉搜索树的第k大节点
* 2021-02-18 11:44:28
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
    vector<int> ans;
    int kthLargest(TreeNode* root, int k) {
        dfs(root);
        reverse(ans.begin(), ans.end());
        return ans[k-1];
    }
    void dfs(TreeNode* root){
        if(!root) return ;
        dfs(root->left) ;
        ans.push_back(root->val);
        dfs(root->right);
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
