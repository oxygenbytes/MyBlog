---
title: "[剑指 Offer 50]第一个只出现一次的字符"
date: 2021-02-18 11:43:19+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。 
//
// 示例: 
//
// s = "abaccdeff"
//返回 "b"
//
//s = "" 
//返回 " "
// 
//
// 
//
// 限制： 
//
// 0 <= s 的长度 <= 50000 
// Related Topics 哈希表 
// 👍 72 👎 0

/*
* 剑指 Offer 50 第一个只出现一次的字符
* 2021-02-18 11:43:19
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    char firstUniqChar(string s) {
        unordered_map<char, int> mp;
        for(auto x : s) mp[x]++;

        for(auto x : s)
            if(mp[x] == 1) return x;
        return ' ';
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
