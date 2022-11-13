---
title: "[剑指 Offer 32 - III]从上到下打印二叉树 III"
date: 2021-02-18 11:37:40+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。 
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
// 返回其层次遍历结果： 
//
// [
//  [3],
//  [20,9],
//  [15,7]
//]
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
// 👍 73 👎 0

/*
* 剑指 Offer 32 - III 从上到下打印二叉树 III
* 2021-02-18 11:37:40
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
    vector<vector<int>> levelOrder(TreeNode* root) {
        vector<vector<int>> ans;
        if(!root)  return ans;
        bfs(root, ans);
        return ans;
    }

    void bfs(TreeNode* root, vector<vector<int>>& ans){
        if(!root) return ;
        queue<TreeNode*> q;
        q.push(root);
        vector<int> temp;
        int j = 1;
        while(q.size()){
            int n = q.size();
            temp.clear();
            j++;
            for(int i = n - 1;i >= 0;i--){
                auto t = q.front();
                temp.push_back(q.front()->val);
                q.pop();
                if(t->left) q.push(t->left);
                if(t->right) q.push(t->right);
            }
            if(j % 2 == 0) ans.push_back(temp);
            else {
                reverse(temp.begin(), temp.end());
                ans.push_back(temp);
            }
        }
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
