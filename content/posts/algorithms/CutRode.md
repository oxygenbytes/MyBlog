---
title: "剪绳子问题"
date: 2019-04-05
lastmod: 2020-04-13
draft: false
tags: ["Algorithms", "递归", "问题"]
toc: true
categories: ["中文"]
author: "zxq"
---

### 题目描述

> 给你一根长度为n的绳子，请把绳子剪成整数长的m段（m、n都是整数，n>1并且m>1），每段绳子的长度记为k[0],k[1],...,k[m]。请问k[0]xk[1]x...xk[m]可能的最大乘积是多少？
> > 例如，当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此时得到的最大乘积是18。

### 题目分析

要让最大乘积最大，则当n > 5时，使用尽可能多的3。

### 贪心算法

* 数学分析

$$
\begin{matrix}
	if\space x\\%3 &numOf2 &numOf3\newline
	\space\space 0 & 0 & x/3\newline
	\space\space 1 & 2 & x/3-1\newline
	\space\space 2 & 1& x/3\newline
\end{matrix}
$$

#### 实现代码

```java
public int cutRope2(int target) {
    if (target < 2)
        return 0;
    if (target == 2)
        return 1;
    if (target == 3)
        return 2;

    int numOf3 = target / 3;
    int numOf2 = 0;
    if (target % 3 == 1) {
        numOf3--;
        numOf2 = 2;
    }
    if(target % 3 == 2){
        numOf2 = 1;
    }
    //  int numOf2 = (target -  numOf3*3) / 2;
    return (int) (Math.pow(2, numOf2) * Math.pow(3, numOf3));
}
```

### 递推算法

#### 数学分析

$$
f(n)=
	\begin{cases}
		f(n-3), & \text{if $n$ > 6}\newline
		[1,2,4,6],& \text{if n = 2,3,4,5}
	\end{cases}
$$

#### 实现代码

```java
public int cutRope(int target) {
        int n = 60;
        int[] dp = new int[n+1];
        dp[2] = 1;dp[3] = 2;
        dp[4] = 4;dp[5] = 6;
        for(int i = 6;i <= 60;i++){
            dp[i] = 3 * dp[i-3];
        }
        return dp[target];
}
```

### 递归算法

#### 数学分析

$$
f(n)=
	\begin{cases}
		f(n-3), & \text{if $n$ > 6}\newline
		[1,2,4,6],& \text{if n = 2,3,4,5}
	\end{cases}
$$

#### 实现代码

```java
public class Solution {
public int cutRope(int target) {
            if (target == 2)
                return 1;
            if (target == 3)
                return 2;
            if(target == 4)
                return 4;
            if(target == 5)
                return 6;
            return cutRope(target - 3) * 3;
    }
}
```

