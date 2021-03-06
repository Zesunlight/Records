## 基本概念

- 工作区（Working Directory）就是你在电脑里能看到的目录
- `git add` 把文件添加进去，实际上就是把文件修改添加到暂存区；
- `git commit` 提交更改，实际上就是把暂存区的所有内容提交到当前分支。
- `git add` 命令实际上就是把要提交的所有修改放到暂存区（Stage），然后执行git commit就可以一次性把暂存区的所有修改提交到分支

## 本地管理

- 创建新的库 repository

```bash
git init
Initialized empty Git repository in /Users/michael/learngit/.git/
```

- 要添加的文件放到库目录下

```bash
git add file1.txt
git add file2.txt file3.txt
git commit -m "add 3 files"
```

- `git status` 命令查看仓库当前的状态

- `git diff your_file` 查看修改了什么内容

- `git log` 命令显示从最近到最远的提交日志

- `git reflog` 查看命令历史

- 回退命令，`git reset --hard HEAD^` 或者 `git reset --hard commit_id` 

  Git中用`HEAD`表示当前版本，上一个版本是`HEAD^`，上上一个版本是`HEAD^^`，往上100个版本可以写成`HEAD~100`

- 从版本库中删除文件，用命令`git rm`删掉，并且`git commit` 

## 远程控制
- 创建SSH Key `ssh-keygen -t rsa -C "2714616793@qq.com"`，再在Github设置中“Add SSH Key”，在Key文本框里粘贴id_rsa.pub文件的内容

- 关联远程库 `git remote add origin git@github.com:Zesunlight/Online-Judge.git` 

- 本地库的所有内容推送到远程库上 `git push -u origin master`，把当前分支`master`推送到远程

  加上`-u`参数，Git会把本地的`master`分支和远程的`master`分支关联起来，之后推送不必再加

- 克隆远程库 `git clone git@github.com:Zesunlight/Online-Judge.git` 

- 本地上传Github

  ```bash
  git add README.md
  git add --all
  git commit -m "注释"
  git push -u origin master
  ```

## 日常维护

- commit 后回退
  `git reset --hard 1094a | git reset --hard HEAD^`

- add 后回退
  把暂存区的修改撤销掉，工作区的修改仍然存在
  `git reset HEAD <file>`  用HEAD时，表示最新的版本
  
- 未 add 回退
  `git checkout -- file` 会影响工作区的文件
  其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都可以一键还原
  

## 参考

https://www.liaoxuefeng.com/wiki/896043488029600