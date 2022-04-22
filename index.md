@def title = "智慧能源系统导论"
@def tags = ["建模", "仿真", "优化", "控制"]

# 环境设置
## Julia的安装

视频版本：

{{bilibili Julia的安装}}

## VSCode的安装

视频版本：

{{bilibili VSCode的安装}}


## Windows Terminal的安装

视频版本：

{{bilibili WindowsTerminal的安装}}

## msys2的安装

视频版本：

{{bilibili msys2的安装}}

## CLion安装及Fortran插件设置

视频版本：

{{bilibili CLion安装及Fortran插件设置}}


## IJulia-Jupyter安装

视频版本：

{{bilibili IJulia-Jupyter安装}}

# 编程第一课-函数

## 编程就是写函数

## 函数可能有返回值，也可能没有返回值

## 编程的函数不同于数学上的函数

## 函数能被调用，能被嵌套的调用

## 函数可能会改变参数本身的内容，也可能不会
fortran的subroutine与function，c的传值与传地址

## 函数并不一定有名字
lambda表达式

## 加减乘除本质就是函数
parse，运算符与函数，前缀表达式与中缀表达式
c++的运算符重载，python的__add__，julia的Base.+

## 主函数并不是必须的，但运行程序必须有个入口
julia的、python的、java的入口有什么差异

## 提供给函数的参数需要按约定好的要求
函数的参数

## 函数可以封装成库给别人调用，有动态库，有静态库
dll，lib，so，a，dylib，

## 函数能跨语言调用
dll被python调用，dll被julia调用，在fortran与c混合编程中iso_c_binding的桥梁作用

## 可执行程序就是个函数，但是函数参数的给定方式是命令行参数
c语言的命令行参数，fortran程序的命令行参数

## 程序执行时的环境变量也会影响函数的行为

## 函数运行时的“环境”与闭包，盗梦空间，打游戏的技能表，栈

## 事件驱动与死循环，服务程序

## 对死循环程序的控制，任务管理器与上帝之手

## 操作系统就是最初的那个根函数

## c++的函数模板与泛型编程

## 动态类型语言与静态类型语言，及它们的互相靠拢
python的类型提示

## 模型与符号

## 从符号到模型与parser

## 函数的调用就是用它来处理你的模型

## 模型处理与代码生成

## 编译器也是个函数
c语言的编译过程，c编译到汇编，汇编编译到0101，链接，

## 移植、平台与上层无关性

## make与makefile以及项目文件

## 从make，到automake，configure，再到qmake，wmake，以及cmake

## cmake也是个函数

## 计算就是机械化的信息处理

# 编程第二课-递归

## 斐波拉契数列与递归

## 递归与循环

## 四则混合运算、表达式树与递归

## 交互式编程与解释器
我们提交一个Add 3 4

## 抽象语法树

## 递归处理是解释器的处理办法

# 编程第三课-抽象与封装

## 结构体，有理数的加减乘除

## 结构体演变为类

## 以类为基础的面向对象编程，封装，继承，多态

## 算法的不依赖于具体的类型
C++的模板类
julia的参数类型

## java的java、class、jar

## julia的多重分发

## go的嵌入体

## 库与头文件、包、模块

## 软件包与生态

## 名字空间

# 编程第四课-图形界面与低代码开发
## 从gcc、gdb到IDE
## 儿童编程Scratch与背后的code
## 从delphi、C#、QT到浏览器

# 编程第五课-如何掌握所有的语言
掌握关键语言特性，忽略次要特性
注意那个差异的地方

# 编程第六课-如何学习
## 编程与算法，sicp与leecode
## 食材、调料与大餐
## 搜索引擎、github

# 编程第七课-再论抽象与封装
## 硬件的一层又一层抽象
## 对用户友好与对机器友好
从javascript到typescript
从0101到汇编到c，再到今天的高级语言
## 软件的一层又一层抽象
从ops说说计算方法与硬件无关性
DSL与库
## 知识的结构
欧几里得几何原本
自然数的定义
让我们谈谈lambda演算
lisp的本质，xml，ant
## 站在巨人的肩膀上

# 写在最后
吾生也有涯，而知也无涯
知识在爆炸，与时俱进
从下到上的学习与从上到下的做事，不同的阶段，框架与细节相结合
学习与成功五要素，学习的能力、学习的驱动力、学习的路径、机缘、持续努力
前进的方法，实践、认识、再实践、再认识