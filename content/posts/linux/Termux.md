---
title: "Termux 使用指南"
date: 2020-08-12T09:30:07+08:00
draft: false
toc: true
tags:
  - Termux
  - Linux
---

### 安装
[Termux](https://termux.com/) 是一款基于 Android 平台的开源 Linux 终端模拟器，使用 pkg(apt) 进行软件包的管理。可以在 `Google play` 安装最新版的 `termux` 和 `termux-API` 。`Termux` 支持缩放手势来调整字体大小，长按屏幕可以调出菜单选项，可以实现粘贴复制等操作。侧边栏可以新建、切换、重命名会话session。

安装常用的基本软件
```bash
pkg install termux-api vim -y
```

### 配置ssh
首先PC端需要安装 `openssh-client`, `termux`中安装 `openssh`。

```bash
# PC端
sudo apt-get install openssh-client
# termux中
pkg install openssh 
# PC端生成ssh秘钥
ssh-keygen
# Termux开启ssh服务
sshd
# 将PC端 ~/.ssh/ 目录下的id_rsa.pub中的内容写入termux中的 ~/.ssh/authorized_keys文件内
# 注意： PC端 ~/.ssh/know_hosts文件中不应有与termux的ssh进程重复的条目
# 一旦出现 WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED! 的提示，删除PC端 ~/.ssh/know_hosts文件中的对应条目即可
```

新版本的 `termux` 已经支持 `ssh` 的密码登录，可以使用 `passwd` 初始化 `ssh` 密码

### 定制常用按键

```bash
# 新建并编辑配置文件
vim ~/.termux/termux.properties
```

内容为：

```bash
extra-keys = [ \
 ['ESC','|','CTRL','HOME','UP','END','~','DEL'], \
 ['TAB','/','>','LEFT','DOWN','RIGHT','BACKSLASH','BKSP'] \
]
# 重启键盘就会出现，上述键位出现次数高，常用，建议添加
```

### 配置剪切板共享
```bash
# clipboard
alias cg='termux-clipboard-get'
alias cs='termux-clipboard-set'
​```
### 配置zsh&&oh-my-zsh

```bash
pkg install zsh
sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"  
vim .zshrc # 修改主题为random
```

### 配置Chfs

```bash
# 电脑上下载chfs-linux-arm64-2.0.zip
# 网址： https://iscute.cn/tar/chfs/2.0/chfs-linux-arm64-2.0.zip
# 使用scp命令将下载的电脑上的文件传输给termux，在PC端执行：
scp -P 8022 chfs-linux-arm64-2.0.zip u0_a165@192.168.43.1:~/.chfs
unzip chfs-linux-arm64-2.0.zip
```

编写脚本

```bash
#!/data/data/com.termux/files/usr/bin/bash
# 参考自：https://github.com/zsxwz/zstermux/blob/master/chfs.sh
# 记得授予termux访问文件的权限
if ! [ -x "$(command -v screen)"  ] ; then
apt install screen -y
fi

if [ ! -x "$(command -v chfs)"  ] ; then
    cd ~/.chfs
    chmod +x chfs
    mv chfs /data/data/com.termux/files/usr/bin/chfs
    read -p "请输入用户名:" name
    echo "$name" > name
    var1=$(cat name)
    read -p "请输入密码:" password
    echo "$password" |base64 -i > password
    var2=$(base64 -d password)
    screen -dmS chfs chfs --port=1234 --path="/sdcard" --rule="::r|$var1:$var2:rwd"
    echo -e "\033[31m请用chrome浏览器打开，127.0.0.1:1234\033[0m"dd
	echo ""
    am start -a android.intent.action.VIEW -d http://127.0.0.1:1234
    
else
    cd ~/.chfs
    var1=$(cat name)
    var2=$(base64 -d password)
    screen -dmS chfs chfs --port=1234 --path="/sdcard" --rule="::r|$var1:$var2:rwd"
fi
exit
```

修改脚本权限并执行脚本

```bash
chmod +x chfs.sh
./chfs.sh
bash chfs.sh
# 浏览器打开 http://127.0.0.1:1234 查看是否配置成功
# 当打开chfs服务后，就可以在局域网中利用：<ip>:<port> ip=手机ip，port=1234 访问手机文件了
```

### 利用SCP进行局域网文件传输

1. 修改 `~/.zshrc` 
```bash
alias tomix2="~/.ssh/tomix2.sh"
```
2. `~/.ssh/tomix2.sh` 的脚本内容为
```bash
# 其中8022是termux默认的ssh端口
# u0_a165是安装termux时安卓系统分配的虚拟用户
# 192.168.43.1是安卓手机的局域网ip
scp -P 8022 $1 u0_a165@192.168.43.1:/sdcard/
```

### [termux备份](https://wiki.termux.com/wiki/Backing_up_Termux)

```bash
# Backing up
# In this example, a backup of both home and sysroot will be shown. The resulting archive will be stored on your shared storage (/sdcard) and compressed with gzip.
# 1. Ensure that storage permission is granted:
termux-setup-storage
# 2. Go to Termux base directory:

cd /data/data/com.termux/files
# 3. Backing up files:
tar -zcvf /sdcard/termux-backup.tar.gz home usr
# Backup should be finished without any error. 
```
```bash
# Restoring
#Here will be assumed that you have backed up both home and usr directory into same archive. Please note that all files would be overwritten during the process.
# 1. Ensure that storage permission is granted:
termux-setup-storage

# 2. Go to Termux base directory:
cd /data/data/com.termux/files

# 3. Extract home and usr with overwriting everything and deleting stale files:

tar -zxf /sdcard/termux-backup.tar.gz --recursive-unlink --preserve-permissions

# Now close Termux with the "exit" button from notification and open it again.
```