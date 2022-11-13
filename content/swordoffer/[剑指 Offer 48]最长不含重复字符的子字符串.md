---
title: "[剑指 Offer 48]最长不含重复字符的子字符串"
date: 2021-02-18 11:42:47+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子字符串的长度。 
//
// 
//
// 示例 1: 
//
// 输入: "abcabcbb"
//输出: 3 
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
// 
//
// 示例 2: 
//
// 输入: "bbbbb"
//输出: 1
//解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
// 
//
// 示例 3: 
//
// 输入: "pwwkew"
//输出: 3
//解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
//     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
// 
//
// 
//
// 提示： 
//
// 
// s.length <= 40000 
// 
//
// 注意：本题与主站 3 题相同：https://leetcode-cn.com/problems/longest-substring-without-rep
//eating-characters/ 
// Related Topics 哈希表 双指针 Sliding Window 
// 👍 150 👎 0

/*
* 剑指 Offer 48 最长不含重复字符的子字符串
* 2021-02-18 11:42:47
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int n = s.size();

        unordered_map<char, int> mp;
        int res = 0;
        for(int i = 0, j = 0;j < s.size();j++){
            mp[s[j]]++;
            while(mp[s[j]] > 1){
                mp[s[i]]--;
                i++;
            }
            res = max(res, j - i + 1);
            //cout<<i<<" "<<j<<" "<<res<<endl;
        }
        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
