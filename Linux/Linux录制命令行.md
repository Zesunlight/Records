# Arch Linux 下录制命令行

## [Asciinema](https://asciinema.org/)

### [安装](<https://asciinema.org/docs/installation>)

`pacman -S asciinema` 

### [使用](<https://asciinema.org/docs/usage>)

- 命令行输入 `asciinema rec [filename]` 开始录制
- 键入 `Ctrl+D` 或者输入 `exit` 退出录制
- 命令行输入 `asciinema play [filename]` 播放

### 备注

不输入 filename 可以上传到 asciinema 网站上，可在网页中嵌入播放，如：

```html
<script type="text/javascript" src="https://asciinema.org/a/******.js"
id="asciicast-******" async></script>
```

### 参考

<https://zhuanlan.zhihu.com/p/28423868>

<https://github.com/asciinema/asciinema>

## [Ttygif](<https://github.com/icholy/ttygif>)

### 安装

```bash
git clone https://aur.archlinux.org/ttyrec.git
cd ttyrec
makepkg -i
cd ..
git clone https://aur.archlinux.org/ttygif.git
cd ttygif
makepkg -is
```

### 使用

- `ttyrec filename` 开始录制
- 键入 `Ctrl+D` 或者输入 `exit` 退出录制
- `ttygif filename` 转换为 gif，保存在当前目录下，名为 `ttf.gif` 

### 备注

如果出现错误 `Error: WINDOWID environment variable was empty` 

安装 `sudo pacman -S xdotool`，设置 `export WINDOWID=$(xdotool getwindowfocus)` 

