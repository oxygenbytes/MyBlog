---
title: "[剑指 Offer 13]机器人的运动范围"
date: 2021-02-18 11:31:20+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一
//格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但
//它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？ 
//
// 
//
// 示例 1： 
//
// 输入：m = 2, n = 3, k = 1
//输出：3
// 
//
// 示例 2： 
//
// 输入：m = 3, n = 1, k = 0
//输出：1
// 
//
// 提示： 
//
// 
// 1 <= n,m <= 100 
// 0 <= k <= 20 
// 
// 👍 214 👎 0

/*
* 剑指 Offer 13 机器人的运动范围
* 2021-02-18 11:31:20
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    int calc(int x, int y){
        int res = 0;
        while(x) res += x % 10, x /= 10;
        while(y) res += y % 10, y /= 10;
        return res;
    }
    int m, n, k;
    int movingCount(int _m, int _n, int _k) {
        result = 0;
        m = _m, n = _n, k = _k;

        vector<vector<bool>> visited(m, vector<bool>(n, false));
        dfs(0, 0, visited);
        return result;
    }
    int result;
    int dx[4] = {-1, 0, 1, 0};
    int dy[4] = {0, 1, 0, -1};
    void dfs(int x, int y, vector<vector<bool>>& visited){
        if(visited[x][y])
            return ;
        if(calc(x, y) > k){
            visited[x][y] = true;
            return ;
        }
        result ++;
        visited[x][y] = true;
        for(int i = 0;i < 4;i++){
            int a = x + dx[i], b = y + dy[i];
            if(a >= 0 && b >= 0 && a < m && b < n){
                dfs(a, b, visited);
            }
        }
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
