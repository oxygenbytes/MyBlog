---
title: "[剑指 Offer 37]序列化二叉树"
date: 2021-02-18 11:39:58+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请实现两个函数，分别用来序列化和反序列化二叉树。 
//
// 示例: 
//
// 你可以将以下二叉树：
//
//    1
//   / \
//  2   3
//     / \
//    4   5
//
//序列化为 "[1,2,3,null,null,4,5]" 
//
// 注意：本题与主站 297 题相同：https://leetcode-cn.com/problems/serialize-and-deserialize-b
//inary-tree/ 
// Related Topics 树 设计 
// 👍 109 👎 0

/*
* 剑指 Offer 37 序列化二叉树
* 2021-02-18 11:39:58
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
class Codec {
public:

    // Encodes a tree to a single string.
    string serialize(TreeNode* root) {
        string res;
        dfs_s(root, res);
        return res;
    }

    void dfs_s(TreeNode* root, string& res){
        if(!root){
            res += "null ";
            return ;
        }

        res += to_string(root->val) + ' ';
        dfs_s(root->left, res);
        dfs_s(root->right, res);
    }
    // Decodes your encoded data to tree.
    TreeNode* deserialize(string data) {
        int u = 0;
        return dfs_d(data, u);
    }

    TreeNode* dfs_d(string data, int &u){
        // return nullptr;
        if(u == data.size()) return nullptr;
        int k = u;
        while(data[k] != ' ') k++;
        if(data[u] == 'n'){
            u = k + 1;
            return nullptr;
        }
        bool flag = false;
        if(data[u] == '-'){

            flag = true;
        }
        int val = 0;
        u = (flag ? u+1 : u);
        for(int i = u;i < k;i++){
            val = val * 10 + data[i] - '0';

        }
        if(flag) val = -val;
        u = k + 1;
        auto root = new TreeNode(val);
        root->left = dfs_d(data, u);
        root->right = dfs_d(data, u);
        return root;
    }
};

// Your Codec object will be instantiated and called as such:
// Codec codec;
// codec.deserialize(codec.serialize(root));
//leetcode submit region end(Prohibit modification and deletion)
     
```
