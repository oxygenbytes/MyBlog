---
title: "二分算法"
date: 2021-01-30T21:49:10+08:00
draft: false
toc: true
tags:
  - 算法
  - 二分
---
# 二分算法

## 二分模板

二分模板一共有两个，分别适用于不同情况。

### 版本1

当我们将区间[l, r]划分成[l, mid]和[mid + 1, r]时，其更新操作是r = mid或者l = mid + 1;，计算mid时不需要加1。
C++ 代码模板：

```cpp
int bsearch_1(int l, int r)
{
    while (l < r)
    {
        int mid = l + r >> 1;
        if (check(mid)) r = mid;
        else l = mid + 1;
    }
    return l;
}
```

### 版本2

当我们将区间[l, r]划分成[l, mid - 1]和[mid, r]时，其更新操作是r = mid - 1或者l = mid;，此时为了防止死循环，计算mid时需要加1。
C++ 代码模板：

```cpp
int bsearch_2(int l, int r)
{
    while (l < r)
    {
        int mid = l + r + 1 >> 1;
        if (check(mid)) l = mid;
        else r = mid - 1;
    }
    return l;
}
```

## 使用心的

> 假设有一个总区间，经由我们的 check 函数判断后，可分成两部分，
> 若以o作 true，.....作 false 示意较好识别
>
> 如果我们的目标是下面这个v，使用模板 1
>
>  `................vooooooooo` 
>
> 假设经由 check 划分后，整个区间的属性与目标v如下，则使用模板 2
>
>  `oooooooov................` 
>
> 模板1就是在满足chek()的区间内找到左边界，模板2在满足check()的区间内找到右边界。



>二分可以将`求解类型的问题` 转换为 `判定型问题`

## 实数域上的二分算法
实数域上的二分较为简单，确定好需要的的精度 `eps`, 以 `left + eps < right` 为循环条件，每次根据在 `mid` 上根据判定选择 `left = mid`, `right = mid` 分支之一即可。
```cpp
double binary_search(double left, double right){
    while(left + 1e-5 < right){
        double mid = (left + right) / 2;
        if(check(mid)) left = mid;
        else right = mid;
    }
    return mid;
}
```

## 参考

链接：https://www.acwing.com/blog/content/31/