---
title: "[剑指 Offer 20]表示数值的字符串"
date: 2021-02-18 11:33:50+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，字符串"+100"、"5e2"、"-123"、"3.1416"、"-1E-16"、"012
//3"都表示数值，但"12e"、"1a3.14"、"1.2.3"、"+-5"及"12e+5.4"都不是。 
//
// 
// Related Topics 数学 
// 👍 148 👎 0

/*
* 剑指 Offer 20 表示数值的字符串
* 2021-02-18 11:33:50
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
/*
    先去除行首和行尾空格；
    行首如果有一个正负号，直接忽略；
    如果字符串为空或只有一个'.'，则不是一个合法数；
    循环整个字符串，去掉以下几种情况：
    (1) '.'或'e'多于1个;
    (2) '.'在'e'后面出现；
    (3) 'e'后面或前面为空，或者'e'前面紧跟着'.'；
    (4) 'e'后面紧跟着正负号，但正负号后面为空；
    剩下的情况都合法；
 */
class Solution {
public:
    bool isNumber(string s) {
        int i = 0;
        while (i < s.size() && s[i] == ' ') i ++ ;
        int j = s.size() - 1;
        while (j >= 0 && s[j] == ' ') j -- ;
        if (i > j) return false;
        s = s.substr(i, j - i + 1);

        if (s[0] == '-' || s[0] == '+') s = s.substr(1);
        if (s.empty() || s[0] == '.' && s.size() == 1) return false;

        int dot = 0, e = 0;
        for (int i = 0; i < s.size(); i ++ )
        {
            if (s[i] >= '0' && s[i] <= '9');
            else if (s[i] == '.')
            {
                dot ++ ;
                if (e || dot > 1) return false;
            }
            else if (s[i] == 'e' || s[i] == 'E')
            {
                e ++ ;
                if (i + 1 == s.size() || !i || e > 1 || i == 1 && s[0] == '.') return false;
                if (s[i + 1] == '+' || s[i + 1] == '-')
                {
                    if (i + 2 == s.size()) return false;
                    i ++ ;
                }
            }
            else return false;
        }
        return true;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
