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
- use `git restore --staged <file>...` to unstage
- use `git restore <file>...` to discard changes in working directory

```
# 恢复暂存区的指定文件到工作区
$ git checkout [file]

# 恢复暂存区当前目录的所有文件到工作区
$ git checkout .

# 恢复工作区到指定 commit
$ git checkout [commit]

# 重置暂存区的指定文件，与上一次 commit 保持一致，但工作区不变
$ git reset [file]

# 重置暂存区与工作区，与上一次 commit 保持一致
$ git reset --hard

# 重置当前分支的指针为指定 commit，同时重置暂存区，但工作区不变
$ git reset [commit]

# 重置当前分支的HEAD为指定 commit，同时重置暂存区和工作区，与指定 commit 一致
$ git reset --hard [commit]

# 新建一个 commit，用于撤销指定 commit
$ git revert [commit]

# 将未提交的变化放在储藏区
$ git stash

# 将储藏区的内容恢复到当前工作区
$ git stash pop
```

## 解决冲突

解决冲突的常规流程：

1. **前提条件：不能在 master 分支上修改任何文件。master 分支的变更只能通过 git pull 和 git merge 获得。在 master 分支下面，不能手动修改任何文件。**
2. 我们自己有一个分支用来修改代码，例如我的分支叫做`dev`分支。我把代码修改完成了，现在不知道有没有冲突。
3. 在 dev 分支里面，执行命令`git merge origin/master`，把远程的`master`分支合并到当前`dev`分支中。如果没有任何报错，那么直接转到第5步。
4. 如果有冲突，根据提示，把冲突解决，保存文件。然后执行命令`git add xxx`把你修改的文件添加到缓存区。然后执行命令`git commit -m "xxx"`添加 commit 信息。
5. 执行如下命令，切换到 master 分支：`git checkout master`。
6. 执行命令`git pull`确保当前 master 分支是最新代码。
7. 把`dev`分支的代码合并回 master 分支：`git merge dev`。
8. 提交代码：`git push`。

## 技巧

- 在`git clone`时加上`--depth 1` ，可以不用取回所有git历史记录，加快下载，减少硬盘空间占用。

## 参考

- https://www.liaoxuefeng.com/wiki/896043488029600

- https://www.kingname.info/2020/09/13/how-to-reslove-conflict/
- https://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html