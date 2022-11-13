---
title: "[28]实现 strStr()"
date: 2021-06-11 17:48:58+08:00
draft: false
tags:
  - Leetcode
---
```cpp
//实现 strStr() 函数。 
//
// 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如
//果不存在，则返回 -1 。 
//
// 
//
// 说明： 
//
// 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。 
//
// 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。 
//
// 
//
// 示例 1： 
//
// 
//输入：haystack = "hello", needle = "ll"
//输出：2
// 
//
// 示例 2： 
//
// 
//输入：haystack = "aaaaa", needle = "bba"
//输出：-1
// 
//
// 示例 3： 
//
// 
//输入：haystack = "", needle = ""
//输出：0
// 
//
// 
//
// 提示： 
//
// 
// 0 <= haystack.length, needle.length <= 5 * 104 
// haystack 和 needle 仅由小写英文字符组成 
// 
// Related Topics 双指针 字符串 
// 👍 932 👎 0

/*
* 28 实现 strStr()
* 2021-06-11 17:48:58
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int strStr(string haystack, string needle) {
        int m = haystack.size();
        int n = needle.size();

        if(!n) return 0;
        vector<int> next(n);
        next[0] = -1;
        int j = -1;
        // next[i]是子串s[0..i]的最长相等前后缀的前缀最后一位的坐标
        for (int i = 1; i < n; i++) {
            while (j > -1 && needle[i] != needle[j + 1]) j = next[j];
            if (needle[i] == needle[j + 1]) j++;
            next[i] = j;
        }

        j = -1;
        for(int i = 0;i < m;i++){
          while(j > -1 && haystack[i] != needle[j+1]) j = next[j];
          if(haystack[i] == needle[j+1]) j++;
          if(j == n - 1)
            return i - n + 1;
        }
        return -1;
    }
};

//leetcode submit region end(Prohibit modification and deletion)
   
```
