---
title: "二叉树的遍历算法"
date: 2020-08-30T21:49:10+08:00
draft: false
toc: true
tags:
  - 
---

二叉树的遍历算法是理解递归和搜索的关键算法，也可以用来思考程序状态问题和分类讨论思想。

### 二叉树的先序遍历

非递归版本
```cpp
class Solution {
public:
    vector<int> preorderTraversal(TreeNode* root) {
        if(!root) return {};
        vector<int> result;
        stack<TreeNode*> s;
        TreeNode* ptr = root;
        while(!s.empty() || ptr){
            if(ptr){
                result.push_back(ptr->val);
                s.push(ptr);
                ptr = ptr->left;
            }else{
                ptr = s.top();s.pop();
                ptr = ptr->right;
            }
        }
        return result;
    }
};
```

递归版本
```cpp
class Solution {
public:
    vector<int> postorderTraversal(TreeNode* root) {
        vector<int> result;
        dfs(root, result);
        return result;
    }
private:
    void dfs(TreeNode* root, vector<int>& res){
        if(root){
            dfs(root->left,res);
            dfs(root->right, res);
            res.push_back(root->val);
        }
    }
};
```         


### 中序遍历

非递归版本
```cpp
class Solution {
public:
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> result;
        if(!root) return result;
        stack<TreeNode*> s;
        TreeNode* ptr = root;
        while(!s.empty() || ptr){ // 指针不空或者stack不空
            if(ptr){ // 1. 指针不空，stack空 2.指针不空，stack不空
                s.push(ptr);
                ptr = ptr -> left;
            }else{ // 3. 指针空，stack不空  4. 指针空，stack空（这种情况进不了while循环的）
                ptr = s.top();s.pop();
                result.push_back(ptr->val);
                ptr = ptr->right;
            }
        }
        return result;
    }
};
```

递归版本
```cpp
class Solution {
public:
    vector<int> inorderTraversal(TreeNode* root) {
        vector<int> result;
        dfs(root, result);
        return result;
    }
private:
    void dfs(TreeNode* root, vector<int>& res){
        if(root){
            dfs(root->left,res);
            res.push_back(root->val);
            dfs(root->right, res);
        }
    }
};
```

### 后序遍历

非递归版本
```cpp
class Solution {
public:
    vector<int> postorderTraversal(TreeNode* root) {
        if(!root) return {};
        stack<pair<TreeNode*,bool>> s;
        vector<int> result;
        TreeNode* ptr = root;
        while(!s.empty() || ptr){
            if(ptr){
                s.push(make_pair(ptr,false));
                ptr = ptr->left;
            }else{
                auto now = s.top();s.pop();
                if(now.second == false){
                    s.push(make_pair(now.first,true));
                    ptr = now.first->right;
                }else{
                    result.push_back(now.first->val);
                }
            }
        }
        return result;
    }
};
```

递归版本
```cpp
class Solution {
public:
    vector<int> postorderTraversal(TreeNode* root) {
        vector<int> result;
        dfs(root, result);
        return result;
    }
private:
    void dfs(TreeNode* root, vector<int>& res){
        if(root){
            dfs(root->left,res);
            dfs(root->right, res);
            res.push_back(root->val);
        }
    }
};
```