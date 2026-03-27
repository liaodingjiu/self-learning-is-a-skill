## 自学是一种技能
## Self-learning is a skill

<!--
## Hi ，I'm  there 👋


**liaodingjiu/liaodingjiu** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->

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
pip3 -V     # 输出路径包含/usr/local/bin（brew路径）3. 用brew的pip3安装Jupyter Lab（推荐）或Notebook安装Jupyter Lab（功能更全，现代界面）pip3 install jupyterlab或安装经典版Jupyter Notebook（按需选择）pip3 install jupyter notebook方式 2：通过 brew 的jupyterlab公式安装（简化版）


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

# Markdown

推荐你学习一门最简单的语言，那就是Markdown。
为什么要学习？
在人工智能时代，你必须掌握这门技能。

难不难？
不难！
因为Markdown是text to Html最简单有效的语言，目前所有的AI大模型都支持的通用的输出格式。
其实其语言定义也就A4纸两页这么大一点，不管你是文科生，还是理科生，都应该能够学会。

关键官方网站上还有一个技能考试的地方，验证完了给你一个证书。

Markdown是由创始人John Gruber 维护，是所有 Markdown 实现的原始规范来源。

ChatGPT、Claude、Kimi……几乎所有主流AI工具，输入和输出的默认格式都是Markdown。

你发给AI的提示词，用Markdown写结构更清晰，AI理解得更准确；

AI返回的回答，本身就是Markdown渲染出来的。

不仅如此，程序员写技术文档用它，产品经理写PRD用它，自媒体人排版公众号用它，研究者在GitHub和Notion上协作也用它。

可以说，Markdown已经成为数字世界的"通用排版语言"。

还在它极其简单。花10分钟读完这篇文章，你就能掌握90%的常用语法。

由于其简单高效，所以未来掌握这门语言技巧十分重要。


