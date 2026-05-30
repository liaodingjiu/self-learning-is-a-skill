#  配置自己习惯的jupyter lab


很多人希望用jupyter notebook，但是我是直接入手 jupyter lab的，所以根据你的习惯来，怎么方便怎么使用。

但是发现直接编辑 jn使用起来更加的方便。


## 安装Anaconda 

之前都是单独安装jupter lab的。

Anaconda 是目前最方便的 Python 发行版，搭载了很多我们终将必用的软件包，除了 Python 之外，还有 R 语言，还包括 Pandoc，NumPy，SciPy，Matplotlib…… 等等。

无论是图形化界面安装，还是命令行界面安装，建议都把 Anaconda 安装在本地，现在提供一条指令安装的方法，直接使用curl安装即可，比wget还要简单。。


```bash
curl -O https://repo.anaconda.com/archive/Anaconda3-2025.12-2-MacOSX-arm64.sh
```


Anaconda 安装网址如下，直接登录可以学习更多的内容：
[Anaconda](https://www.anaconda.com/docs/getting-started/anaconda/install/mac-cli-install)




# How to Install Juypter lab




使用 Homebrew（Mac 专属包管理器）安装 Jupyter 是最省心的方式，因为它会自动处理 Python 环境变量、依赖冲突等问题，比 pip 安装更稳定。下面是完整的 brew 安装 Jupyter 的步骤，包括前置准备、安装、验证和启动：
## 一、前置准备：安装 Homebrew（如果未安装）
如果你的 Mac 还没装 Homebrew，先执行以下命令安装（复制到终端直接运行）：

bash

运行brew的官方安装脚本，全程自动完成
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
plaintext
```

安装完成后，执行brew -v验证，能输出版本号说明安装成功。


## 二、用 brew 安装 Jupyter（分 2 种方式，推荐方式 1）

方式 1：先装 Python（brew 版），再装 Jupyter（推荐）
brew 本身没有直接的jupyter公式，而是先装 brew 管理的 Python（自动配置环境变量），再用 pip3 安装 Jupyter，这是最稳定的组合：
bash
运行1. 安装brew版Python（会自动替换系统默认Python，配置PATH）brew install python2. 验证Python和pip3（brew安装后会自动链接）python3 -V  # 输出版本号，如Python 3.12.2
pip3 -V     # 输出路径包含/usr/local/bin（brew路径）

3. 用brew的pip3安装Jupyter Lab（推荐）或Notebook安装Jupyter Lab（功能更全，现代界面）pip3 install jupyterlab或安装经典版Jupyter Notebook（按需选择）pip3 install jupyter notebook方式
  
5. 2：通过 brew 的jupyterlab公式安装（简化版）


brew 社区维护了jupyterlab公式，可一键安装（本质还是依赖 brew 的 Python）：
bash
运行直接安装jupyterlab（会自动安装依赖的Python）

brew install jupyterlab

⚠️ 注意：这种方式安装的版本可能略滞后于 pip，但胜在一键完成，适合新手。

## 三、验证安装是否成功
执行以下命令，能输出版本号说明安装成功：
bash
运行验证Jupyter Lab版本
jupyter lab --version

或验证Jupyter Notebook版本（如果装了）

jupyter notebook --version

验证命令是否可执行（核心）

jupyter --version

如果输出类似7.0.7（Jupyter Lab 版本）的信息，说明环境变量和安装都没问题。


## 四、启动 Jupyter（brew 安装后直接用命令）
bash
运行启动Jupyter Lab（推荐）
jupyter lab

或启动Jupyter Notebookjupyter notebook

或者通过brew进行启动

brew services start jupyterlab

brew services start jupyterlab

执行后会自动唤起 Mac 默认浏览器，进入 Jupyter 界面，无需手动复制链接（终端也会输出备用链接）。


## 五、常见问题解决
brew install jupyterlab 提示 “找不到公式”
先更新 brew 仓库：brew update，再重新安装。
启动后提示 “端口被占用”
指定端口启动：jupyter lab --port 8889。
brew 安装的 Python 和系统 Python 冲突
brew 安装的 Python 默认在/usr/local/bin，优先级高于系统 Python，无需额外配置；如果想确认，执行which python3，输出/usr/local/bin/python3即为正常。


## 六、卸载（如需）
如果需要卸载 brew 安装的 Jupyter：
bash
运行卸载pip安装的Jupyterpip3 uninstall jupyterlab jupyter notebook -y如果是brew公式安装的，额外执行brew uninstall jupyterlab
总结
核心步骤：先装 brew → 用 brew 装 Python → 用 pip3 装 jupyterlab（最稳定）；
简化方式：直接brew install jupyterlab，一键完成（版本略滞后）；
优势：brew 自动配置环境变量，无需手动改 PATH，启动直接用jupyter lab命令。
这种方式能彻底解决 Mac 上 “jupyter 命令找不到” 的问题，是新手最推荐的安装路径。



## 七、查看jupyter的版本

jupyter lab --version


————————

## 如何设置zsh的默认终端登录目


要设置 Zsh 终端默认打开的目录，最直接有效的方法是修改 Zsh 的配置文件 ~/.zshrc。🛠️ 修改 Zsh 配置文件这是最常用和推荐的方法。你只需在配置文件中添加一行 cd 命令，即可在每次启动新的终端会话时自动切换到指定目录。
1. 打开配置文件
使用你喜欢的文本编辑器打开 ~/.zshrc 文件。例如，使用 VS Code 或 nano：

code ~/.zshrc

或者

nano ~/.zshrc

2. 添加切换目录命令

在文件的末尾添加以下命令，将/path/to/your/directory 替换为你希望默认打开的目录路径：bash编辑1# 切换到指定目录

```
cd /path/to/your/directory
```

你也可以使用环境变量，例如切换到用户主目录：

bash编辑
cd ~

3. 使配置立即生效
保存文件后，在终端中执行以下命令，让更改立即生效，无需重启终端：

bash

source ~/.zshrc

现在，当你打开一个新的终端窗口时，它就会自动进入你设置的目录了。

如何设置jupyter的登录目录


## 如何设置jupyter默认的登录目录

通常按照永久性修改目录就可以了，就是修改后每次启动 Jupyter Lab 都会自动进入指定目录


* 1. 生成配置文件
打开 Anaconda Prompt 或终端，输入以下命令并回车：

bash
jupyter lab --generate-config

执行后，终端会显示配置文件的路径，通常位于 C:\Users\你的用户名\.jupyter\jupyter_lab_config.py。


* 2. 编辑配置文件

使用vscode记事本或其他文本编辑器jupyter_lab_config.py 文件

code ~/.jupyter/jupyter_lab_config.py

* 3. 修改默认的目录

通常在jupyter_lab_config.py 文件的最后加入 

#c.ServerApp.root_dir = '' 

但是由于加了注释符号#，这句话是不起作用的，所以去掉#号之后才生效，然后修改目录

c.NotebookApp.notebook_dir = '~/self-learning-is-a-skill'

今后就默认进入这个目录了，你可以修改成为其他的目录。


另外，如果使用notebook，那么最好再加一行

c.NotebookApp.default_url = '/tree'

c.NotebookApp.open_browser = true #打开默认浏览器，比如设置为chrome



## 问题解决：编辑窗口频闪，无法操作。

Mac 上 Jupyter Lab 编辑文本时频闪，核心原因是 Jupyter 的「窗口化渲染（Windowing）」与 macOS 图形层 / 浏览器硬件加速冲突，按下面步骤可快速解决。
一、最有效：关闭 Jupyter 窗口化渲染（必试）
Jupyter Lab 4.x/ Notebook 7.x 默认 Windowing mode: full，在 macOS 上极易闪屏。
永久修复（设置里改）
打开 Jupyter Lab → 菜单 Settings → Advanced Settings Editor
左侧选 Notebook
右侧找到 Windowing mode
把 full 改为 defer（推荐）或 none（彻底关闭）
保存 → 刷新页面（或重启 Lab）



## Jupyter 的图片在哪里？可以上传至 Git吗？


## 如何让notebook可以实现预览


Jupyter Notebook 原生其实不支持像 Typora 那样的“所见即所得”实时分屏预览，它默认是“编辑模式”和“渲染模式”分离的。

不过，你可以通过以下几种方式来实现类似的效果：🧩

使用插件实现分屏预览（最推荐）如果你使用的是 JupyterLab（Jupyter Notebook 的下一代界面），可以通过安装插件来实现左侧写代码/Markdown，右侧实时预览的效果。

安装 jupyterlab-preview 插件这是一个非常流行的插件，允许你在编辑 Markdown 单元格时，在右侧面板实时渲染预览。


1. 安装插件包（在 Anaconda Prompt 或终端中运行）：


pip install jupyterlab-preview

或者

conda install -c conda-forge jupyterlab-preview

2. 重启 JupyterLab。

3. 使用方法：选中一个 Markdown 单元格。

5. 点击工具栏上的“眼睛”图标（或者在命令面板中搜索 "Preview Markdown"）。右侧会出现一个预览面板，当你编辑左侧内容时，右侧会实时更新。



## 两个版本的 jupyter 如何统一

默认启动一个 jupyter lab 的程序，conda 启动另外一个程序。有时候感觉没有统一起来，怎么办呢？

先进入 conda 环境，没有任何提示，然后看 jupyter-lab 的版本。

(base) judy@192 ~ % conda activate jlab_new
(jlab_new) judy@192 ~ % jupyter-lab --version
4.4.2
(jlab_new) judy@192 ~ % 


退出conda activate 

>```
conda deactivate
>```


## 如何让粘贴的图片和记事本分开

由于直接粘贴的图片默认是直接嵌在 .ipynb 文件里的（Base64 编码），不是单独文件，因此会出现粘贴的图片内容导致 ipynb 文件很大很臃肿，并且传到 git 上之后别人无法协同。会出现乱码，因此最好将图片和记事本分开，这样，协同工作的时候，就不会出现乱码。

需要安装的插件如下：

>```
conda install -c conda-forge jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextension enable paste_image/main
>```












