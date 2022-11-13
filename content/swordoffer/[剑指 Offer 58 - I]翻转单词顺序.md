---
title: "[剑指 Offer 58 - I]翻转单词顺序"
date: 2021-02-18 11:46:27+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，
//则输出"student. a am I"。 
//
// 
//
// 示例 1： 
//
// 输入: "the sky is blue"
//输出: "blue is sky the"
// 
//
// 示例 2： 
//
// 输入: "  hello world!  "
//输出: "world! hello"
//解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
// 
//
// 示例 3： 
//
// 输入: "a good   example"
//输出: "example good a"
//解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
// 
//
// 
//
// 说明： 
//
// 
// 无空格字符构成一个单词。 
// 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。 
// 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。 
// 
//
// 注意：本题与主站 151 题相同：https://leetcode-cn.com/problems/reverse-words-in-a-string/ 
//
//
// 注意：此题对比原题有改动 
// Related Topics 字符串 
// 👍 66 👎 0

/*
* 剑指 Offer 58 - I 翻转单词顺序
* 2021-02-18 11:46:27
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    string reverseWords(string s) {
        if(s.size() <= 0)  return s;

        int pos;
        vector<string> ans;
        for(int i = 0, j = 0;i < s.size() && j <= s.size(); j++){
            if(s[i] == ' ')   i++;
            else if(s[j] == ' ' || j == s.size()){
                ans.push_back(s.substr(i, j - i));
                i = j+1;
            }
        }
        reverse(ans.begin(), ans.end());
        string res;

        for(int i = 0;i < ans.size();i++){
            if(i == 0) res += ans[i];
            else res += ' ', res += ans[i];
        }

        return res;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
