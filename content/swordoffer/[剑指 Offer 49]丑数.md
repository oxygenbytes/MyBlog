---
title: "[剑指 Offer 49]丑数"
date: 2021-02-18 11:43:06+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。求按从小到大的顺序的第 n 个丑数。 
//
// 
//
// 示例: 
//
// 输入: n = 10
//输出: 12
//解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。 
//
// 说明: 
//
// 
// 1 是丑数。 
// n 不超过1690。 
// 
//
// 注意：本题与主站 264 题相同：https://leetcode-cn.com/problems/ugly-number-ii/ 
// Related Topics 数学 
// 👍 116 👎 0

/*
* 剑指 Offer 49 丑数
* 2021-02-18 11:43:06
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int nthUglyNumber(int n) {
        vector<int> num(1, 1);

        int i = 0, j = 0, k = 0;
        while(--n){
            int t = min(num[i] * 2, min(num[j] * 3, num[k] * 5));
            num.push_back(t);
            // cout<<i<<" "<<j<<" "<<k<<" "<<endl;
            if(num[i] * 2 == t) i ++ ;
            if(num[j] * 3 == t) j ++ ;
            if(num[k] * 5 == t) k ++ ;
        }
        return num.back();
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
