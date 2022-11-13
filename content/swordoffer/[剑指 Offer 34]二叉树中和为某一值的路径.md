---
title: "[剑指 Offer 34]二叉树中和为某一值的路径"
date: 2021-02-18 11:38:17+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。 
//
// 
//
// 示例: 
//给定如下二叉树，以及目标和 sum = 22， 
//
//               5
//             / \
//            4   8
//           /   / \
//          11  13  4
//         /  \    / \
//        7    2  5   1
// 
//
// 返回: 
//
// [
//   [5,4,11,2],
//   [5,8,4,5]
//]
// 
//
// 
//
// 提示： 
//
// 
// 节点总数 <= 10000 
// 
//
// 注意：本题与主站 113 题相同：https://leetcode-cn.com/problems/path-sum-ii/ 
// Related Topics 树 深度优先搜索 
// 👍 132 👎 0

/*
* 剑指 Offer 34 二叉树中和为某一值的路径
* 2021-02-18 11:38:17
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
    vector<vector<int>> res;
    vector<int> cur;

    vector<vector<int>> pathSum(TreeNode* root, int sum) {
        if(!root) return res;
        dfs(root, sum);
        return res;
    }
    void dfs(TreeNode* root, int sum){
        if(!root) return ;
        cur.push_back(root->val);
        sum -= root->val;
        if(!root->left && !root->right && !sum) res.push_back(cur);
        dfs(root->left, sum);
        dfs(root->right, sum);
        sum += root->val;
        cur.pop_back();
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
