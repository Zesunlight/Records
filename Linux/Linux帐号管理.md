# Linux帐号管理

## 帐号与群组的文件

### `/etc/passwd` 文件结构（用户帐号表）

- 各程序当然需要读取 `/etc/passwd` 来了解不同账号的权限，因此 `/etc/passwd` 的权限需配置为 `-rw-r--r--` 
- 每一行使用`:`分隔开，7个字段
- 账户名称，口令，UID，GID，用户信息说明，家目录，Shell
- 因为这个文件的特性是所有的程序都能够读取，这样一来很容易造成口令数据被窃取， 因此后来就将这个字段的口令数据给他改放到 `/etc/shadow`中了

### `/etc/shadow` 文件结构（用户口令表）

- 将口令移动到 `/etc/shadow` 这个文件分隔开来的技术， 而且还加入很多的口令限制参数
- 每一行使用`:`分隔开，9个字段
- 帐号名称，口令，最近更改口令的日期，口令不可被更改的天数，口令需要重新变更的天数，口令需要变更期限前的警告天数，口令过期后的账号宽限时间(口令失效日)，账号失效日期，保留

### `/etc/group` 文件结构（群组）

- 每一行使用`:`分隔开，4个字段
- 组名，群组口令，GID，支持的帐号名称

## 用户管理

- `useradd [-u UID] [-g initial_group] username` 添加用户
- 若没有指定用户组，会创建一个和用户名同名的组
- `passwd username` 设置密码
- Arch 不会默认创建用户家目录
  - `mkdir /home/username` 
  - `chown username:username /home/username` 
- `usermod` 调整用户配置数据
- `userdel -r username` 连同家目录一起删除

## 群组管理

- `groupadd [-g gid] group_name` 添加组
- `groupdel group_name` 删除组
  - 有某个账号 `(/etc/passwd)` 的 `initial group` 使用该群组，则无法删除该群组
  - 可修改该帐号的 GID 或者删除该帐号，才能删除该群组
- `gpasswd -a username group_name` 将用户添加到组
- `gpasswd -d username group_name` 将用户移除组

## 身份切换

- 若要完整的切换到新使用者的环境，必须要使用 `su - username` 或 `su -l username` ， 才会连同 `PATH/USER/MAIL` 等变量都转成新用户的环境
- `sudo` 可以让你切换身份来进行某项任务，`sudo [-u 新使用者账号] order` 
- 当用户运行 `sudo` 时
  - 系统于 `/etc/sudoers` 文件中搜寻该使用者是否有运行 `sudo` 的权限
  - 若使用者具有可运行 `sudo` 的权限后，便让使用者『输入用户自己的口令』来确认
  - 能否使用 `sudo` 必须要看 `/etc/sudoers` 的配置值

## 参考

- <http://cn.linux.vbird.org/linux_basic/0410accountmanager_1.php>
- <http://cn.linux.vbird.org/linux_basic/0410accountmanager_2.php>
- <http://cn.linux.vbird.org/linux_basic/0410accountmanager_4.php>



