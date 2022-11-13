---
title: "Git 学习"
date: 2021-01-30T21:49:10+08:00
draft: false
toc: true
tags:
  - Git
  - Linux
---

# Git 学习

主要记录一些git学习的笔记内容

[git学习链接](<https://marklodato.github.io/visual-git-guide/index-zh-cn.html>)

### git分支管理

1. 新建分支    git checkout -b branchname
2. 切换分支     git checkout  branchname
3. 查看分支      git  branch

比如你现在在dev，克隆下来的是主分支(main)

如果你要进行什么修改，可以建一个新的分之，比如按照今天的日期

```bash
git checkout -b 190721
git checkout 190721
# 这样就切换到了新分支
```



### 新建git仓库，并且推送到github

```bash
# create a new repository on the command line github官方指导
git init # 仓库初始化，初始化对象是当前目录
git init newrepo # 初始化特定文件夹，并且在newrepo中出现一个.git目录
git add * # 将当前目录中所有文件纳入版本控制，提交到暂存区
git commit -m "first commit" # 提交到版本库
git remote add origin git@github.com:cogitates/Mynote.git # 连接远程仓库
git push -u origin master # 将本地的仓库推送到远程仓库
```



### 当系统重装后，如何连接git和github

[github官方参考链接](https://docs.github.com/en/github/authenticating-to-github/troubleshooting-ssh)

先下载git

```bash
sudo apt-get git # deepin
sudo pacman -S git #manjaro
```



然后为本地 git 配置全局的 user 与 email 参数。

```bash
$ git config ‐‐global user.name "your github account name"
$ git config ‐‐global user.email "your github account email"
```



为了在后续操作中我们能将本地仓库的代码推送至 github 的仓库上,我们需要在本地生成
SSH 秘钥,并将公钥保存到 github 账户信息中,这样我们在本地提交的时候 github 就能通
过本地的私钥与公钥进行校验。

```bash
$ ssh‐keygen ‐t rsa ‐C "your github account email"
```

复制当前主目录下~/.ssh/id_rsa.pub，只需要把公钥的内容提交给 github 。

进入Github的个人setting 界面,选择 SSH and GPG keys ,点击 New SSH key ,在展开的窗口中填写密钥信息,title 可以随意，方便自己管理即可,key 那一栏则把刚刚生成的 id_rsa.pub 的内容复制进去。最后点击按钮添加。

测试是否连接到github

```bash
ssh -T git@github.com
```

问题一

```bash
$ ssh -vT git@github.com
> ...
> Agent admitted failure to sign using the key.
> debug1: No more authentication methods to try.
> Permission denied (publickey).
```

采取措施

```bash
# star图片t the ssh-agent in the background
$ eval "$(ssh-agent -s)"
> Agent pid 59566
$ ssh-add
> Enter passphrase for /home/you/.ssh/id_rsa: [tippy tap]
> Identity added: /home/you/.ssh/id_rsa (/home/you/.ssh/id_rsa)
```

问题二

```bash
ermissions 0777 for '~/.ssh/id_rsa' are too open
```

采取措施

```bash
chmod -R 700 id_rsa id_rsa.pub known_hosts passwd
```

### 版本回退

- `git reset --hard HEAD^`回退到上一版本
- `git reset --hard HEAD^`回退到上上版本
- `git reset --hard HEAD~100`回退到上100个版本
- `git reset --hard 具体版本号`回退到具体版本号 
  记录每一次命令：`git reflog` 
  `git checkout -- readme.txt`： 
  命令`git checkout -- readme.txt`意思就是，把`readme.txt`文件在工作区的修改全部撤销，这里有两种情况： 
  一种是`readme.txt`自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态； 
  一种是`readme.txt`已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。 
  总之，就是让这个文件回到最近一`次git commit`或`git add`时的状态。

 