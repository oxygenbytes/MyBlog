---
title: "[剑指 Offer 07]重建二叉树"
date: 2021-02-18 11:29:29+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。 
//
// 
//
// 例如，给出 
//
// 前序遍历 preorder = [3,9,20,15,7]
//中序遍历 inorder = [9,3,15,20,7] 
//
// 返回如下的二叉树： 
//
//     3
//   / \
//  9  20
//    /  \
//   15   7 
//
// 
//
// 限制： 
//
// 0 <= 节点个数 <= 5000 
//
// 
//
// 注意：本题与主站 105 题重复：https://leetcode-cn.com/problems/construct-binary-tree-from-
//preorder-and-inorder-traversal/ 
// Related Topics 树 递归 
// 👍 318 👎 0

/*
* 剑指 Offer 07 重建二叉树
* 2021-02-18 11:29:29
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
    unordered_map<int, int> mp;
    TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
        int m = preorder.size();
        int n = inorder.size();
        if(m != n) return nullptr;

        for(int i = 0;i < inorder.size();i++)
            mp[inorder[i]] = i;

        return build(preorder, 0, m-1, inorder, 0, n-1);

    }
    TreeNode* build(vector<int>& pre, int pl, int pr, vector<int>& ino, int il, int ir){
        if(pl > pr) return nullptr;

        TreeNode *root = new TreeNode(pre[pl]);
        int pos = mp[pre[pl]];


        root->left = build(pre, pl + 1, pl + pos - il, ino, il, pos -1);
        root->right = build(pre, pl + pos -il + 1, pr, ino, pos + 1, ir);
        return root;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
