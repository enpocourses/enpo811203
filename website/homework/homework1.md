@def title = "一些典型的环境设置"
@def tags = ["vscode", "julia", "windows terminal", "clion"]

# 一些典型环境的设置

## Julia的安装

### Julia简介
***

#### 历史

一群拥有各种语言丰富编程经验的Matlab高级用户 ,对现有的科学计算编程工具感到不满——这些软件对自己专长的领域表现得非常棒，但在其它领域却非常糟糕。他们想要的是一个开源的软件，它要像C语言一般快速而有拥有如同Ruby的动态性; 要
具有Lisp般真正的同像性而又有Matlab般熟悉的数学记号;要像Python般通用、像R般在统计分析上得心应手、像Perl般自然地处理字符串、像Matlab般具有强大的线性代数运算能力、像shell般胶水语言的能力， 易于学习而又不让真正的黑客感到无聊;还有，它应该是交互式的，同时又是编译型的...

#### 特点

- 核心语言非常小。标准库用的是Julia语言本身写的
- 调用许多其它成熟的高性能基础代码。如线性代数、随机数生成、快速傅里叶变换、字符串处理。
- 丰富的用于创建或描述对象的类型语法
- 高性能，接近于静态编译型语言。包括用户自定义类型等
- 为并行计算和分布式计算而设计
- 轻量级协程
- 优雅的可扩展的类型转换/提升
- 支持Unicode,包括但不限于UTF-8
- 可直接调用C函数(不需要包装或是借助特殊的API)
- 有类似shelI的进程管理能力
- 有类似Lisp的宏以及其它元编程工具

#### 使用场景

主要用于科学计算

- 机器学习
- 数据处理
- 算法仿真
- 数值分析
- ...

在做项目时，先用Python/Matlab完成算法模型验证，再用其他编程语言（如C++）来实现，而有了Julia，则可以一步到位，模型验证和实现是一起的

***

### Julia安装

在[Julia官网](https://julialang.org/)可以进行下载，也可以在[Julia中文社区](https://cn.julialang.org/)进行下载，选择合适的位置安装即可使用。推荐下载免安装的压缩包，解压到合适的目录之后，把对应目录下的bin目录加到环境变量PATH中。解压完毕后，Julia并不能直接在终端直接运行，需要先将Julia可执行目录配置在环境变量中。具体操作为：**进入“设置”—>点击“系统”—>点击左侧“关于”—>点击“高级系统设置”—>点击“环境变量”—>在下方的“系统变量(S)”中对“Path”进行编辑 —>将Julia安装中“bin”文件夹所在的目录复制粘贴即可**。完成此项设置后，打开终端命令行输入“julia”即可运行。

julia安装完毕后，在安装其他扩展包时，可能因为从GitHub上clone的时间过长而失败，这时需要进行换源操作。我们可以使用 https://mirrors.tuna.tsinghua.edu.cn/ 这个镜像，或者 https://mirrors.bfsu.edu.cn/ ，找到julia，点击后边那个问号，参照修改~/.julia/config/startup.jl。

本文档使用的Julia版本为1.7.2，运行环境为Windows10。

视频版本：

{{bilibili Julia的安装}}


***

### VSCode（用于Julia的"IDE"）安装

为了更为便捷地使用Julia语言对项目进行开发，我们选择使用具有强大扩展性能的VSCode作为工具。

到VSCode的官方站点下载安装包，双击之按提示完成安装。打开VSCode，在插件中搜索Julia，安装之。因为之前已经把Julia的bin目录放到了PATH环境变量中了，这里不需要任何进一步的设置。

视频版本：

{{bilibili VSCode的安装}}

***

### IJulia及Jupyter安装

视频版本：

{{bilibili IJulia-Jupyter安装}}

### Pluto安装


为了方便地进行交互式编程，我们选择使用Pluto.jl笔记本进行操作

安装方法为在终端进入Julia后，输入英文中的"]"进入package模式，然后输入

```julia
add Pluto
```

即可安装。

安装完毕后，使用“backspace”键返回正常模式

然后输入

```julia
using Pluto
Pluto.run()
```

即可在默认浏览器中打开。
***

## Windows Terminal的安装

视频版本：

{{bilibili WindowsTerminal的安装}}

## msys2的安装

视频版本：

{{bilibili msys2的安装}}

## CLion安装及Fortran插件设置

视频版本：

{{bilibili CLion安装及Fortran插件设置}}
