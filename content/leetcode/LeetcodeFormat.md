---
title: "关于博客的Leetcode代码的格式和生成"
date: 2020-08-22T21:13:42+08:00
draft: false
toc: true
tags:
  - Leetcode
  - Bash
---

# 刷题时生成C++文件
我以前经常在Vscode中刷leetcode题目，但这种方式的代码不够规范，也比较耗时，因为主力语言是 `C++` ,所以现在在 `Clion` 中利用 `leetcode` 插件来生成代码。个人认为 `C++` 的代码和命名方式优雅。所以决定在博客的 `leetcode` 板块中使用 `C++` 的代码格式。

其中 `Clion` 插件 `leetcode` 的代码模板如下：
```cpp
// CodeFileName: 
[$!{question.frontendQuestionId}]${question.title}

//CodeTemplate:
/*
---
title: "[$!{question.frontendQuestionId}]${question.title}"
date: $!velocityTool.date()+08:00
draft: false
tags:
  - Leetcode
---
*/
${question.content}
/*
* ${question.frontendQuestionId} ${question.title}
* $!velocityTool.date()
* @author oxygenbytes
*/ 
\#include "leetcode.h" 
${question.code}     
```

其中的 `leetcode.h` 文件包含了常用头文件和基本数据结构，如下所示：
```c++
//
// Created by zxq on 2020/8/13.
//

#ifndef LEETCODE_LEETCODE_H
#define LEETCODE_LEETCODE_H

#endif //LEETCODE_LEETCODE_H
#include <bits/stdc++.h>
using namespace std;

// Definition for a binary tree node.
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

// Definition for singly-linked list.
struct ListNode {
    int val;
    ListNode *next;
    ListNode() : val(0), next(nullptr) {}
    ListNode(int x) : val(x), next(nullptr) {}
    ListNode(int x, ListNode *next) : val(x), next(next) {}
};

class Node {
public:
    int val;
    Node* left;
    Node* right;
    Node* random;
    Node* next;
    Node() {}

    Node(int _val) {
        val = _val;
        left = NULL;
        right = NULL;
        random = NULL;
        next = NULL;
    }

    Node(int _val, Node* _left, Node* _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};
```

### 将C++文件转化为MarkDown文件
将待转化的C++文件都拷贝至某一文件夹中，利用 `bash` 脚本进行文件转化

```bash
#!/usr/bin/bash

# sample usage
# ./cpp2md.sh ./temp

path=$1
cd $path

rename 's/\.cpp/\.md/' * # change file name

ls -R *.md > filename.txt
cat filename.txt | while read line
do
    sed -i -e '1d' "$line" # delete /*
    sed -i '8s/\*\//\`\`\`cpp/' "$line" # delete */ and add ```cpp
    sed -i '$a \`\`\`' "$line" # add ``` in the end of file
done
```
最后的效果就像博客中这样，尚有待改进

