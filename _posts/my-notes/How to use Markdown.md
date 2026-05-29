
# How to use Markdown


[https://www.liaodingjiu.com/]



Markdown是text to Html最简单有效的语言，目前所有的AI大模型都支持的通用的输出格式。

Markdown是由创始人John Gruber 维护，是所有 Markdown 实现的原始规范来源。

ChatGPT、Claude、Kimi……几乎所有主流AI工具，输入和输出的默认格式都是Markdown。

你发给AI的提示词，用Markdown写结构更清晰，AI理解得更准确；

AI返回的回答，本身就是Markdown渲染出来的。

不仅如此，程序员写技术文档用它，产品经理写PRD用它，自媒体人排版公众号用它，研究者在GitHub和Notion上协作也用它。

可以说，Markdown已经成为数字世界的"通用排版语言"。

还在它极其简单。花10分钟读完这篇文章，你就能掌握90%的常用语法。

由于其简单高效，所以未来掌握这门语言技巧十分重要。

因为，你的所有的AI提示词均可以用Markdown语言进行编写。





### Markdown操作教程

Jupyter Lab 中的 Markdown 是交互式笔记的核心功能之一，支持标准 Markdown 语法，还额外兼容部分扩展语法（如数学公式、表格、代码块等），能满足数据分析笔记的排版需求。下面我会按「基础排版」「进阶格式」「Jupyter 专属扩展」分类，整理最常用的标注语法，每个语法都附示例，你可以直接在 Jupyter Lab 的 Markdown 单元格中测试。
一、基础排版（最常用）
这是日常笔记最核心的标注，覆盖标题、文本样式、列表等。
表格
语法用途	语法示例	效果展示
标题（1-6 级）	# 一级标题

## 二级标题
### 三级标题	一级标题（最大）
二级标题
三级标题（以此类推）
粗体	**粗体文本**	粗体文本
斜体	*斜体文本* 或 _斜体文本_	斜体文本
粗斜体	***粗斜体文本***	粗斜体文本
删除线	~~删除线文本~~	删除线文本
换行	文本末尾加 两个空格 或 <br>	第一行
第二行
分割线	--- 或 ***	---（显示一条横线）
行内代码	print("hello")	print("hello")



A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a *blockquote* .
> 
> This is the second paragraph in the __blockquote__.
>
> ## This is an H2 in a blockquote
>


Some of these words *are emphasized*.
Some of these words _are emphasized also_.

Use two asterisks for **strong emphasis**.
Or, if you prefer, __use two underscores instead__.


二、进阶格式（结构化排版）
适合整理数据说明、对比表格、引用等场景。
1. 列表
markdown
# 无序列表（三种符号等效）
- 项目1
- 项目2
  - 子项目2.1（缩进2个空格/1个Tab）
  - 子项目2.2

# 有序列表
1. 第一步
2. 第二步
   1. 子步骤2.1
   2. 子步骤2.2

# 任务列表（扩展语法）
- [x] 完成任务1
- [x] 未完成任务2

效果：
1. 项目 1
2. 项目 2
   - 2.1 子项目 2.1
   - 2.2子项目 2.2
1. 第一步
2. 第二步
    - 2.1子步骤 2.1
    - 2.2子步骤 2.2
 - [x] 完成任务 1
 - [x] 未完成任务 2

2. 表格
markdown
| 列1标题 | 列2标题 | 列3标题 |
|---------|---------|---------|
| 内容1   | 内容2   | 内容3   |
| 内容4   | 内容5   | 内容6   |

# 带对齐的表格
| 左对齐 | 居中对齐 | 右对齐 |
|:------ |:-------: |------: |
| 文本1   | 文本2    | 文本3   |
效果：
表格
列 1 标题	列 2 标题	列 3 标题
内容 1	内容 2	内容 3
3. 引用 / 块注释
markdown
> 一级引用（常用于备注、说明）
>> 二级引用（嵌套）
效果：
一级引用
二级引用
4. 链接与图片
markdown
# 超链接
[百度](https://www.baidu.com "可选的提示文字")

# 本地/网络图片
![图片描述](https://xxx/xxx.png)  # 网络图片
![图片描述](./本地图片路径/xxx.png) # 本地图片（相对路径）
三、Jupyter 专属扩展语法
Jupyter Lab 对 Markdown 做了扩展，支持代码块、数学公式等，是数据分析笔记的核心亮点。
1. 代码块（带语法高亮）
markdown
```python
# Python代码块（支持高亮）
import pandas as pd
df = pd.read_csv("data.csv")
print(df.head())
bash
运行
# Shell代码块
jupyter lab --port 8889
plaintext
效果：会显示带语法高亮的代码块，支持Python、Shell、R等几十种语言。

#### 2. 数学公式（LaTeX语法）
Jupyter 支持 LaTeX 数学公式，是数据科学笔记的核心功能：
```markdown
# 行内公式（嵌入文本）
勾股定理：$a^2 + b^2 = c^2$

# 块级公式（单独成行）
$$
f(x) = \frac{1}{\sqrt{2\pi}\sigma} e^{-\frac{(x-\mu)^2}{2\sigma^2}}
$$
效果：
勾股定理：
a 
2
 +b 
2
 =c 
2
 
f(x)= 
2π
​
 σ
1
​
 e 
− 
2σ 
2
 
(x−μ) 
2
 
​
 
3. 单元格内换行与分段
在 Jupyter Markdown 单元格中，直接按 Enter 是换行（需文本末尾加两个空格），按 Shift + Enter 是渲染单元格；空一行可自动分段。
四、使用小技巧
在 Jupyter Lab 中，选中 Markdown 文本后，可通过顶部菜单栏「Format」快速添加粗体、斜体等样式，无需手动输符号；
渲染 Markdown 单元格：按 Shift + Enter（或点击单元格左侧的「运行」按钮）；
编辑已渲染的单元格：双击单元格即可回到编辑模式。
总结
基础标注：标题（#）、粗体（**）、斜体（*）、列表（-/1.）是日常最常用的核心语法；

进阶标注：表格、引用、代码块适合结构化整理数据分析笔记；
Jupyter 专属：LaTeX 数学公式（
/
）是数据科学场景的核心扩展，代码块支持多语言高亮。
这些语法覆盖了 Jupyter Lab Markdown 90% 以上的使用场景，你可以在单元格中逐个测试，快速掌握。