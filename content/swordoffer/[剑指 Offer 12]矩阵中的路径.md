---
title: "[剑指 Offer 12]矩阵中的路径"
date: 2021-02-18 11:30:56+08:00
draft: false
toc: false
tags:
  - SwordOffer
  - Leetcode
---
```cpp
//请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果
//一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。 
//
// [["a","b","c","e"], 
//["s","f","c","s"], 
//["a","d","e","e"]] 
//
// 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。 
//
// 
//
// 示例 1： 
//
// 
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "AB
//CCED"
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：board = [["a","b"],["c","d"]], word = "abcd"
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// 1 <= board.length <= 200 
// 1 <= board[i].length <= 200 
// 
//
// 注意：本题与主站 79 题相同：https://leetcode-cn.com/problems/word-search/ 
// Related Topics 深度优先搜索 
// 👍 242 👎 0

/*
* 剑指 Offer 12 矩阵中的路径
* 2021-02-18 11:30:56
* @author oxygenbytes
*/ 
#include "leetcode.h" 
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
public:
    bool exist(vector<vector<char>>& board, string& word) {
        for(int i = 0;i < board.size();i++){
            for(int j = 0;j < board[0].size();j++){
                if(board[i][j] == word[0]){
                    if(dfs(board, word, 0,  i, j))
                        return true;
                }
            }
        }
        return false;
    }
    int dx[4] = {-1, 0, 1, 0};
    int dy[4] = {0, 1, 0, -1};
    bool dfs(vector<vector<char>>& board, string& word,int len, int x, int y){
        if(len == word.size()  - 1 && board[x][y] == word[len])
            return true;

        if(board[x][y] != word[len]) return false;

        char temp = board[x][y];
        board[x][y] = '@';
        for(int i = 0;i < 4;i++){
            int a = x + dx[i], b = y + dy[i];
            if(a >= 0 && a < board.size() &&  b >= 0 &&  b < board[0].size() && board[a][b] != '@')
                if(dfs(board, word, len+1, a, b)) return true;
        }
        board[x][y] = temp;
        return false;
    }
};
//leetcode submit region end(Prohibit modification and deletion)
     
```
