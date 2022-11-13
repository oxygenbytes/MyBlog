---
title: "[剑指 Offer 32 - I]从上到下打印二叉树"
date: 2021-02-18 11:37:09+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。 
//
// 
//
// 例如: 
//给定二叉树: [3,9,20,null,null,15,7], 
//
//     3
//   / \
//  9  20
//    /  \
//   15   7
// 
//
// 返回： 
//
// [3,9,20,15,7]
// 
//
// 
//
// 提示： 
//
// 
// 节点总数 <= 1000 
// 
// Related Topics 树 广度优先搜索 
// 👍 60 👎 0

/*
* 剑指 Offer 32 - I 从上到下打印二叉树
* 2021-02-18 11:37:09
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
    vector<int> levelOrder(TreeNode* root) {
        vector<int> ans;
        if(!root) return ans;
        bfs(root, ans);
        return ans;
    }

    void bfs(TreeNode* root, vector<int>& ans){
        if(!root) return ;
        queue<TreeNode*> q;
        q.push(root);
        while(q.size()){
            TreeNode* t = q.front();
            ans.push_back(t->val);
            q.pop();
            if(t->left) q.push(t->left);
            if(t->right) q.push(t->right);
        }
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
