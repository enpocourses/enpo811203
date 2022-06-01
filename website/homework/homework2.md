
## 准备环境

按照[一些典型环境的设置](homework1)的步骤，安装julia、msys2、mingw、clion。

## 理解函数，从匿名函数到有名函数

使用clion编写一个函数，在主函数中进行调用。使用julia测试一下匿名函数。然后给匿名函数命个名，通过函数名进行调用。

## 通过clion创建dll库理解函数封装成动态链接库

使用clion新建项目，c或者c++的library项目，分别进行动态的、静态的库创建，比较产生的文件的异同。并且进行编译，看生成的文件的异同。尝试写一个主函数，调用dll中自己写的函数。

## 通过julia调用dll理解函数跨语言调用

把上述dll放到julia能找到的地方，使用julia进行调用dll中的函数。

## 阅读关于环境变量、关于make与makefile等内容，还有cmake内容

阅读[make和makefile介绍](https://seisman.github.io/how-to-write-makefile/)，理解程序编译过程，理解makefile描述的是依赖关系和生成规则。

## 通过coolprop的julia调用理解接口，理解实际应用

从 http://sourceforge.net/projects/coolprop/files/CoolProp/6.4.1/Julia 下载CoolProp.jl。从 https://sourceforge.net/projects/coolprop/files/CoolProp/6.4.1/shared_library/Windows/64bit/ 下载CoolProp.dll。
对CoolProp.jl适当修改如下，保证coolproplibrary能找到dll文件。进行julia调用CoolProp.dll计算物性操作。
```
const coolproplibrary = joinpath(@__DIR__, "./CoolProp.dll")
```

实际上，现在CoolProp已经直接有julia接口了，在 https://github.com/CoolProp/CoolProp.jl 。它实质是通过jll去编译了CoolProp，获得相应的dll文件。

## 进一步通过安装IJulia，Pluto，chrome等实际操作熟悉计算机

按照[一些典型环境的设置](homework1)的步骤，安装IJulia、Pluto。Chrome呢，是因为浏览器本身就可以用于javascript编程，而且我们需要在一些时候查看网页的源码理解文件的结构。


