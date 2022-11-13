---
title: "[剑指 Offer 29]顺时针打印矩阵"
date: 2021-02-18 11:36:05+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。 
//
// 
//
// 示例 1： 
//
// 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[1,2,3,6,9,8,7,4,5]
// 
//
// 示例 2： 
//
// 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
//输出：[1,2,3,4,8,12,11,10,9,5,6,7]
// 
//
// 
//
// 限制： 
//
// 
// 0 <= matrix.length <= 100 
// 0 <= matrix[i].length <= 100 
// 
//
// 注意：本题与主站 54 题相同：https://leetcode-cn.com/problems/spiral-matrix/ 
// Related Topics 数组 
// 👍 190 👎 0

/*
* 剑指 Offer 29 顺时针打印矩阵
* 2021-02-18 11:36:05
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        int dx[] = {-1, 0 ,1, 0}, dy[] = {0, 1, 0, -1};

        vector<int> ans;
        int m = matrix.size();
        if(!m) return ans;
        int n = matrix[0].size();
        if(!n) return ans;

        vector<vector<bool>> vis(m, vector<bool>(n, false));

        int x = 0, y = 0, d =1;

        for(int i = 0;i < n * m;i++){
            ans.push_back(matrix[x][y]);
            vis[x][y] = true;
            int a = x + dx[d];
            int b = y + dy[d];

            if(a < 0 || a >= m || b < 0 || b >= n || vis[a][b]){
                d = (d + 1) % 4;
                a = x + dx[d];
                b = y + dy[d];
            }
            x = a, y = b;
        }
        return ans;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
