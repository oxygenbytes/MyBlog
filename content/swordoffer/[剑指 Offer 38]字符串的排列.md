---
title: "[剑指 Offer 38]字符串的排列"
date: 2021-02-18 11:40:19+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个字符串，打印出该字符串中字符的所有排列。 
//
// 
//
// 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。 
//
// 
//
// 示例: 
//
// 输入：s = "abc"
//输出：["abc","acb","bac","bca","cab","cba"]
// 
//
// 
//
// 限制： 
//
// 1 <= s 的长度 <= 8 
// Related Topics 回溯算法 
// 👍 183 👎 0

/*
* 剑指 Offer 38 字符串的排列
* 2021-02-18 11:40:19
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:

    set<string> se;
    vector<string> permutation(string s) {
        vector<bool> vis(s.size(), false);
        string cur;
        dfs(s, vis, cur);
        vector<string> res;
        for(auto it = se.begin();it != se.end();it++) res.push_back(*it);
        return res;
    }
    void dfs(string& str, vector<bool>& vis, string& cur){
        if(cur.size() == str.size()){
            se.insert(cur);
            return ;
        }
        for(int i = 0;i < str.size();i++){
            if(!vis[i]){
                string temp = cur;
                cur += str[i];
                vis[i] = true;
                dfs(str, vis, cur);
                vis[i] = false;
                cur = temp;
            }
        }
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
