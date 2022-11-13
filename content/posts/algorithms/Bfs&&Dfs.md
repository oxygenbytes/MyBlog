---
title: "深搜&&广搜"
date: 2020-07-27T23:06:27+08:00
draft: false
toc: false
images:
tags:
  - Algorithms
---


深搜和广搜是最重要的几种算法之一，理解深搜和广搜的关键在于理解 `递归` ， `状态机` ， `容器适配器--堆&&栈` 和 `集合分类` 四个概念。

<!-- more -->

**在搜索中，节点的状态有很多种(节点的状态此时主要根据操作来定义)，比如：未被访问的节点，被访问但是后续仍要用于寻找相邻节点的点，被访问并且后续不会被用到的点。其中，第二类点仍有使用的必要，因此将之放入特定容器，也就是队列或者栈。**

### 深度优先搜索

深度优先搜索是一种用于遍历或搜索图或者树的算法。沿着树的深度遍历树的节点，尽可能深的搜索树的分支。当节点v的所在边都己被探寻过，搜索将回溯到发现节点v的那条边的起始节点。这一过程一直进行到已发现从源节点可达的所有节点为止。如果还存在未被发现的节点，则选择其中一个作为源节点并重复以上过程，整个进程反复进行直到所有节点都被访问为止。属于盲目搜索。

```c++
// 深度优先搜索
vector<int> G[MAX];
bool visit[MAX];
stack<int> stack;

void DFS(int u){
    visit[u] = 1;
    for(int i = 0;i < G[u].size();i++){ // 邻接关系
        int v = G[u][i];
        if(!visit[v]){
            DFS(v);
        }
    }
}

void Dfs(int u){
    visit[u] = 1;
    stack.push(u);
    while(!stack.empty()){
        int u = stack.top();
        stack.pop();
        for(int i = 0;i < G[u].size();i++){ // 邻接关系
            int v = G[u][i];
            if(!visit[v]){
                visit[v] = 1;
                stack.push(v);
            }
        }
    }
    
}

```

深度搜索的逻辑是这样的：将被访问但是后续仍要用于寻找相邻节点的点存入栈容器，这样的话，**最先被访问的节点**将是**最后用于寻找相邻节点**的点。也就实现了所谓的回溯。

| A  B  C  D  E   F  G  H  I

-------------------> 访问顺序

| A  B  C  D  E   F  G  H  I

<------------------- 寻找邻接点的顺序



### 广度优先搜索

广度优先搜索算法（英语：Breadth-First-Search，缩写为BFS），又译作宽度优先搜索，或横向优先搜索，是一种图形搜索算法。简单的说，BFS是从根节点开始，沿着树的宽度遍历树的节点。如果所有节点均被访问，则算法中止。广度优先搜索的实现一般采用open-closed表。属于盲目搜索。

```c++
// 深度优先搜索
vector<int> G[MAX];
bool visit[MAX];
stack<int> stack;

void DFS(int u){
    visit[u] = 1;
    for(int i = 0;i < G[u].size();i++){ // 邻接关系
        int v = G[u][i];
        if(!visit[v]){
            DFS(v);
        }
    }
}

void Dfs(int u){
    visit[u] = 1;
    stack.push(u);
    while(!stack.empty()){
        int u = stack.top();
        stack.pop();
        for(int i = 0;i < G[u].size();i++){ // 邻接关系
            int v = G[u][i];
            if(!visit[v]){
                visit[v] = 1;
                stack.push(v);
            }
        }
    }
}
```

广度搜索的逻辑是这样的：将被访问但是后续仍要用于寻找相邻节点的点存入队列容器，这样的话，**最先被访问的节点**将是**最先用于寻找相邻节点**的点。

 A  B  C  D  E   F  G  H  I

-------------------> 访问顺序

 A  B  C  D  E   F  G  H  I

--------------------> 寻找邻接点的顺序
