---
title: "线性代数的本质"
date: 2020-08-06T19:42:44+08:00
draft: false
toc: true
images:
tags:
  - 数学
  - 线性代数
---

### 1p 什么是向量？

1. 定义坐标系
2. 物理系，计算机系，数学系对向量的不同认识
3. 向量可以是任何东西，只要保证两个向量相加以及数字与向量想成是有意义的即可。
4. 可以将向量看作一种运动。从运动的角度定义向量加法和数乘运算。标量对向量而言，作用就是缩放。

### 2p 向量的线性组合，张成的空间和基

1. 作为标量的向量坐标
2. **将向量的每个坐标看作一个标量，考虑它们如何拉伸或压缩一个向量**

3. 引入单位向量作为坐标系的基，基向量是坐标缩放的对象
4. 定义向量的线性组合：两个数乘向量的和被称为这两个向量的线性组合
5. **定义向量张成的空间(span)：所有可以表示为给定向量线性组合的向量的集合成为给定向量张成的空间**
6. 定义线性相关和线性无关：N个向量可以张成的空间为N维空间，则这N个向量是线性无关的，否则是线性相关的。
7. 定义空间的一组基：张成该空间的一个线性无关向量的集合。

### 3p 矩阵与空间线性变换

1. “变换”实际上就是函数，它接受输入内容并输出对应结果，而在线性变换中输入的是向量，输出的也是一个向量，**这中间的这个函数就是变换矩阵。**
2. 线性变换的几何约束：线性变换必须满足两点要求，首先变换前后直线依旧是直线，其次 **原点保持不变** 。值得注意的是不仅仅要考虑水平与竖直的直线变换前后是否依旧是直线，还要考虑对角线的不是水平的线。线性变换应该是一种 **保持网格平行且等距分布** 的变换。
3. 记录两个基向量i帽和j帽变换后的位置，其他向量都会随之而动；只要记录了变换后的i帽和j帽，我们就可以推断出任意向量在变换之后的位置，完全不必观察变换本身是什么样。
4. **矩阵：矩阵只是一个记号，它含有描述一个线性变换的信息。向量的列可以理解为变换后对应原基向量的一组基。**

### 4p 矩阵乘法与线性复合变换

1. 两个矩阵相乘有着几何意义，也就是两个线性变换相继作用。乘积需要从右向左读，首先应用右侧矩阵所描述的变换，然后再应用左侧矩阵所描述的变换，它起源于函数的记号，每次将两个函数复合时，你总是要从右向左读。

### 5p 三维空间中的线性变换

1. 三维空间的概念可以由二维推广得到。
2. 三维线性变换由基向量的去向完全决定，只考虑跟踪这些基向量的话会更容易观察这些线性变换。

### 6p 行列式

1. 矩阵的行列式可以衡量矩阵对应的线性变换对空间的缩放程度。
2. 对二维空间来说，线性变换改变面积的比例，被称为这个变换的行列式。
3. 只需要检验一个矩阵的行列式是否为0，我们就能了解这个矩阵所代表的变换是否将空间压缩到更小的维度上。
4. 完整概念下的行列式是允许出现负值的，这和定向的概念有关，当空间定向改变的情况发生时，行列式为负，但是行列式的绝对值依然表示区域面积的缩放比例。行列式在三维空间中的意义仍然是变换前后的缩放比例，但在三维空间中表现为体积的缩放。

### 7p 逆矩阵，列空间，零空间

1. 总的来说， $A^{-1}$ 是满足以下性质的唯一变换，首先应用 $A$ 代表的变换，再应用 $A^{-1}$ 代表的变换，你会回到原始状态。两个变换相继作用在代数上体现为矩阵乘法。 $A^{-1}A$ 等于一个“什么都不做”的矩阵。
2. 如果变换后的向量落在某个二维平面上，所以说 **“秩”代表着变换后空间的维数** ，意味着基向量仍旧能张成整个二维空间。
3. 不管是一条直线、一个平面还是三维空间等，所有可能的变换结果的集合，被称为矩阵的“列空间”。换句话说，列空间就是矩阵的列所张成的空间。**所以更精确的秩的定义是列空间的维数。**
4. **对一个满秩变换来说，唯一能在变换后落在原点的就是零向量自身，如果一个三维线性变换将空间压缩到一条直线上，那么就有一整个平面上的向量在变换后落在原点，变换后落在原点的向量的集合，被称为矩阵的“零空间”或“核”。**
5.  每个线性方程组都有一个线性变换与之联系。矩阵 $A$ 代表一种线性变换。
    ，所以求解 $Ax=v$ 意味着我们去寻找一个向量 $x$，使得它在变换后与 $v$ 重合。
6. 每个方程组都有一个线性变换与之联系，当逆变换存在时，你就能用这个逆变换求解方程组，否则，列空间的概念让我们清楚什么时候存在解，零空间的概念有助于我们理解所有可能的解的集合是什么样的。

### 8p 非方阵

1. 一个 $3×2$ 矩阵，这个矩阵的列空间，是三维空间中一个过原点的二维平面，但是这个矩阵仍然是满秩的，因为列空间的维数与输入空间的维数相等。它的几何意义是将二维空间映射到三维空间上，矩阵有两列表明输入空间有两个基向量，有三行表明每一个基向量在变换后都用三个独立的坐标来描述。可以理解为将二维坐标系扩充为三维。

### 9p 点积与对偶性

1. 多维空间到一维空间（数轴）的线性变换，有不少函数能够接收二维向量并输出一个数。
2. 两个向量点乘，就是将其中一个向量转化为线性变换。
3. 向量仿佛是一个**特定变换的概念性记号**。对一般人类来说，想象空间中的向量比想象这个空间移动到数轴上更加容易。

### 10p 叉积

1. 假如你有两个向量 $\vec v$ 和 $\vec w$ ，考虑它们所张成的平行四边形， $\vec v$ 和 $\vec w$ 的叉积，就是这个平行四边形的面积。我们还要考虑定向问题，大致来讲，如果 $\vec  v$ 在 $\vec w$ 的右侧，那么$\vec v$ 叉乘 $\vec w$ 为正，并且值等于平行四边形的面积。但是如果 $\vec v$ 在 $\vec w$ 的左侧那么 $\vec v$ 叉乘 $\vec w$ 为负，即平行四边形面积的相反数。注意，这就是说顺序会对叉积有影响。
2. 真正的叉积是通过两个三维向量生成一个新的三维向量。这个向量的长度就是平行四边形的面积，而这个向量的方向与平行四边形（所在的面）垂直。
3. 对于给定的向量 $\vec v$ 和 $\vec w$ ,其对应着唯一一个叉积向量 $\vec x$ 。对于任意的向量 $\vec u$ 而言，$\vec u,\vec v,\vec w$ 三个向量组成的六面体的体积（行列式值）等于$\vec x$ 与 $\vec u$ 点积的结果。这也就是为什么可以使用行列式来记忆叉积。而使用 $\vec i,\vec j,\vec k$ 的单位向量的作用仅仅是根据 $\vec u$ 向量的坐标值将 $\vec u $ 向量化。

### 11p 基变换

1. 空间的原点重合，但是基向量不同。所有基向量在其自身的坐标系中都是单位向量。
2. 现在给定两个坐标系，一个是我们的坐标系，另外一个是詹妮佛的坐标系。在不同坐标系之间进行转化的时候可以使用矩阵向量乘法。**转移矩阵** 用我们的语言表达詹妮佛的基向量，称为基变换。反之，转移矩阵的逆，表示用詹妮佛的基底表示我们的基底，可以实现从詹妮佛的矩阵向我们矩阵的变换。
3. 一个矩阵的列为詹妮弗的基向量，这个矩阵可以看作一个线性变换，它将我们的基向量i帽和j帽，也就是我们眼中的 $(1, 0)$ 和 $(0, 1)$ ，变换为用詹妮弗的基向量描述的我们的 $(1, 0)$ 和 $(0, 1)$ 。
4. 理解 $A^{-1}MA$ 的意义。 $M$ 是在我们的空间描述某一特定的线性变换。$A$ 是从詹妮佛坐标系向我们坐标系进行基变换的转移矩阵，$A^{-1}$ 是从我们坐标系向詹妮佛坐标系进行基变换的转移矩阵。最终 $A^{-1}MA$ 就是用詹妮佛坐标系描述的同样意义的线性变换。 $A^{-1}MA\vec x = \vec b$ 中对于詹妮佛空间的向量 $\vec x$ 而言，首先左乘基变换矩阵，那么$\vec x$ 就会变成用我们空间描述的向量；接着左乘线性变换矩阵，即在我们的空间进行线性变换 $M$ ,并且变换后的结果向量依然用我们的空间描述；最后左乘基变换矩阵的逆阵，结果向量就成为了使用詹妮佛空间描述的向量。
5. 表达式中 $A^{-1}MA$ 暗示着一种数学上的转移作用。两侧的矩阵完成了视角上的转换。

### 12p 特征向量和特征值

1. 一个向量张成的空间是当前向量所在的直线。
2. 对于某个特定的线性变换，在变换前后，大部分向量都在变换中离开了其张成的空间，但是某些特殊向量的确落在它们张成的空间里，这意味着矩阵对它们的作用仅仅是拉伸或者压缩而已，如同一个标量一样。这些特殊向量就被称为变换的“特征向量”，每个特征向量都有一个所属的值，被称为“特征值”，即衡量特征向量在变换中拉伸或压缩比例的因子。
3. 处理 $A\vec x = \lambda \vec x$ 这个式子，在满足这个式子的时候，其中$\vec x$ 是 $A$ 的特征向量，$\lambda$ 是A的特征向量。
4. 如果我们的基向量刚好是特征向量，那么对于这个线性变换来说，其对应的矩阵为对角矩阵（所有的基向量都是特征向量）。
5. 对角矩阵有很多良好的性质。其中一个重要的方面是，矩阵与自己多次相乘的结果更容易计算，因为对角矩阵仅仅让基向量与某个特征值相乘。**上一节的基变换，描述的是如何在另一个坐标系中表达当前坐标系所描述的变换。** $A^{-1}MA$ 取出你想用作新基的向量的坐标，在这里指的是两个特征向量，然后将坐标作为一个矩阵的列，这个矩阵就是基变换矩阵（ $M$ ），在右侧写下基变换矩阵（$A$），在左侧写下基变换矩阵的逆（$A^{-1}$），当你将原始的变换夹在两个矩阵中间时，所得的矩阵代表的是同一个变换，不过是从新基向量所构成的坐标系的角度来看的。
6. 一组基向量（同样是特征向量）构成的集合被称为一组“特征基”。如果你要计算这个矩阵的n次幂，一种更容易的做法是先变换到特征基，在那个坐标系中计算n次幂，然后转换回标准坐标系。

### 13p 抽象向量空间

1. 数学中有很多类似向量的事物。只要所处理对象，具有合理的数乘和加和概念，不管是空间中的箭头、一组数还是函数集合，线性代数中所有关于向量、线性变换和其他的概念都应该适用于它。这些类似向量的事物，它们构成的集合被称为向量空间。
2. 在数学的表达中，我们倾向于得到用普适的概念，而普适的代价就是抽象。

### 14p 番外之伴随矩阵的几何意义

1. 伴随矩阵 $A^{-1}$ 是求逆矩阵时 $A^{-1}$ 的一个过程量。为什么要费劲周折地求逆矩阵 $A^{-1}$ 呢，为了解方程。 $A\vec x = \vec b \Rightarrow \vec x = \vec bA^{-1}$ 从上面公式可以看出，当经过 $A^{-1}$ 和 $A$ 的复合变换之后，新的向量空间与原来形状相似，但是拉伸为原来的 $|A|$ 倍, $A^{\*}A = AA^{\*} = |A|E$ 。

2. 伴随矩阵起的作用应该是将A对应的变换效果正规化，将所有维度变成同等层次。由上面的公式可以知道，这种正规化建立在对每个维度都扩展到原来的$|A|$ 倍（因为矩阵乘以一个数是针对矩阵中的每一个向量）。

3. 如果A中存在一个维度被压缩（即 $r(A) = n-1$，则 $|A|=0$ ,那么这种正规化将会把所有维度压缩为0，因为只有之前被 $A$ 压缩的维度无法继续被 $A^{\*}$ 压缩，因此 $r(A^{\*}) = 1$ 。

4. 如果A中存在多于一个维度被压缩（即 $r(A) < n-1$，则 $|A|=0$ ,那么这种正规化将会把所有维度压缩为0，因此 $r(A^{*}) = 0$ 。

### 15p 番外之理解二次型

1. 一般的，将含有 $N$ 个变量的的二次齐次函数成为二次型，

$$
q_A(x_1,\ldots,x_n) = \sum_{i=1}^{n}\sum_{j=1}^{n}a_{ij}{x_i}{x_j} = \mathbf x^\mathrm{T} A \mathbf x
$$

称为二次型。二次型可以用矩阵表示，其中$\matrix A$ 是对称矩阵。

2. 二次型讨论的主要问题是：寻求可逆的线性变换
    $$
    \begin {cases}
    x_1 = c_{11}y_1+c_{12}y_{2}+\ldots+c_{1n}y_{n},\newline
    x_2 = c_{21}y_1+c_{22}y_{2}+\ldots+c_{2n}y_{n},\newline
    \space\space\space\space \ldots\ldots\ldots\ldots\newline
    x_n = c_{n1}y_1+c_{n2}y_{2}+\ldots+c_{nn}y_{n}\newline
    \end {cases}
    $$
    使二次型只含有平方项 $$\lambda_1 \vec x_1^2 + \lambda_2 \vec x_2^2 + \ldots + \lambda_n \vec x_n^2$$ 。

3. 把可逆变换记作 $\mathbf x = \matrix C\mathbf y$ ,因此可以得到
    $$
    f = \mathbf x^\mathrm{T} A \mathbf x = (\matrix C\mathbf y)^{T}\mathbf A \mathbf (\matrix C\mathbf y) = \mathbf y^{T}(\matrix C\mathbf A \mathbf \matrix C)\mathbf y
    $$
