@def title = "理解计算"
@def tags = ["compter science", "guide"]

# 理解计算

\tableofcontents

伴随着物联网、大数据、云计算及三维可视化等技术的发展，在“碳达峰、碳中和”双碳目标驱动下，传统工业领域数字化、智能化已经成为第四次工业革命的重要方向之一，这也是中国制造2025的主攻方向。

未来是万物互联、数字孪生、端边云协同的时代。云、大、智、物、移等等是智慧能源绕不开的内容。从数字化到智能化是一个过程，而智能化是整个框架的核心。云、大、物、移都是IT技术。我们需要对计算机有所了解和认识，并能与行业领域专门知识结合，才能更有利于我们塑造智慧化的未来。

那么，非IT工科专业，计算机如何入门呢？

计算就是机械化的信息处理。这点可以先读一读王垠的[《解谜计算机科学》](http://www.yinwang.org/blog-cn/2018/04/13/computer-science)有个认识和了解。也可以先看一看yuziwen的[PL教程 第一章 人和机器](https://yuziwen.github.io/pl-tutorial-1.html)。

接下来，我们会从函数、递归、模型处理、抽象等几个方面进行介绍。

## 从函数说起

有很多人说，计算机入门最合适的捷径就是编程。很多人的编程是从c语言开始的，一开始就陷入了scanf/printf的格式化输入/输出里去。而我们这里高度概括的来讲讲。

### 编程就是写函数

对，编程就是写函数。很多人接触的c语言入门的第一个程序差不多长这样：
```c
#include <stdio.h>
int main() {
    printf("Hello, World!\n");
    return 0;
}
```
而有些学院因为涉及到很多计算密集型的计算，编程采用了Fortran入门，hello world程序像这样：
```
program main
    write(*,*) "Hello, World!"
end program
```
的确，这就是写的函数，是主函数。

- **函数可能有返回值，也可能没有返回值**

像刚才的c代码，return 0返回了整数0。而早期的c语言如果使用void main也是可以，但是却不是标准的语法：
```c
#include <stdio.h>
void main() {
    printf("Hello, World!\n");
}
```
事实上，操作系统会根据程序的返回值判断是否正确执行了。比如bash下，我们执行一条命令之后，可以用`echo $?`来查看上一条命令的返回值。而在windows下，如果使用的是命令行终端(cmd.exe)，可以用`echo %errorlevel%`来查看上一条命令的返回值，如果使用的的是powershell，可以用`$LASTEXITCODE`来获取上一条命令的返回值。

通常程序返回0代表程序正确结束。所以我们c的主函数一般都是int的返回类型，最后有一句return 0。

- **编程的函数不同于数学上的函数**

虽然编程的函数和数学上的函数都使用了function这个词，但含义是不一样的。

数学上的函数就是个定义，比如$y=\sqrt{x}$，描述的就是有个y，其平方是x。

但是编程上的函数是一系列的操作过程，找到这个y，使得其平方是我们给出的那个x。比如我们可以把$y=\sqrt{x}$变形，得到$y^2=x$, 或者说$y=x/y$，那么我们对给定的某个x（如2），我们可以给个y的初值1进去迭代，我们会发现y就在1和2之间“震荡”，那我们可以用旧的y和新的y算术平均$y_{new}=\frac{1}{2}(y_{old}+x/y_{old})$或者加权平均$y_{new}=\alpha y_{old}+(1-\alpha)(x/y_{old})$，来进行迭代，从而找到那个我们希望的y值。

- **函数能被调用，能被嵌套的调用**

写函数的目的实际上是把具有一定功能性代码整合起来，可以重复的使用，也就是可以被调用。比如如下的代码，主函数main调用了fun1，而fun1又调用了fun2：

```c
include <stdio.h>
int fun2()
{
    printf("I am in fun2");
    return 0;
}

int fun1()
{
    printf("I am in fun1");
    fun2();
    return 0;
}

int main()
{
    fun1();
    return 0;
}
```

- **函数可能会改变参数本身的内容，也可能不会**

数学上的函数定义是这样的：给定一个集合A，对于集合X中的每一个元素x，在集合Y中都有唯一的一个元素y和x对应。

事实上，编程中的函数，给定输入的参数x，执行一定的操作，但是这些操作不改变x，那么这样的函数是没有改变参数本身的内容。然而有的函数是会改变参数本身的内容的。比如给你一个数组，调用一个排序函数来排序，以原来的数组名返回排序之后的数组，其实就是改变了参数的内容。

在fortran中，有subroutine和function之分，可以认为function就是纯的函数，而subroutine可以使用参数来承接函数调用之后对参数的改变。

而在c中，如果我们写个交换函数swap，使用传地址的方式进行传参数，实际上也改变了参数本身的内容。

在Julia中，如果一个函数名以！结尾，表明它会改变输入参数的内容。而不带！的函数名，只是会有返回值，不会改变输入参数的值。

- **函数并不一定有名字**

可以认为，没有名字的函数可以使用一次，然后没法再次唤醒它。
在一些语言中，没有名字的函数可以使用lambda表达式进行定义。比如scheme,
```scheme
(lambda (x) (+ x 2))
```
又比如python，
```python
lambda x: x+2
```

在javascript中则可以这样定义函数，
```javascript
x-> x+2
```

甚至，C++，
```cpp
[](float x)->float{return x+2;};
```

没有名字有什么用呢？其实有的，比如在python中，可以使用map来调用一次，
```python
map(lambda x: x+2, [1,3,5,7])
```

比如scheme这样调用，
```scheme
((lambda (x) (+ x 2)) 4)
```
当然，javacript和c++也可以类似的对匿名函数进行使用。

但是匿名函数使用一次，没法在想用的时候再次召唤出来。所以我们可以给它取个名字，就好比给锅安装了个柄，可以通过柄把锅抓住。

如下的C++把匿名函数取了个名字addfunciton，并调用它，
```cpp
auto addfunction=[](float x)->float{return x+2;};
addfunction(3)
```

如下的python代码把匿名函数取了个名字add2，并调用它
```python
add2 = lambda x: x+2
add2(3)
```

如下的scheme代码把匿名函数取了个名字add2，并调用它
```scheme
    (define add2 (lambda (x) (+ x 2)))  (add2 3)
```

给函数取名，是因为我们要方便我们在需要的时候召唤它。

- **加减乘除本质就是函数**

3+4对应的scheme表达可以写成(+ 3 4), 这里+其实就是一个函数。所以说，加减乘除本质上就是函数。
我们甚至可以在julia的repl中这样操作：把 + 运算符（本质就是+函数）赋值给f，通过f(2,3)来调用，
```julia
f = +
f(2,3)
```

我们使用“3+2”这样的表达式时，我们称呼这是中缀表达式。而如果我们按照scheme的写法，(+ 3 2)时，采用的是前缀表达。


可见，运算符就是个函数。

c++可以进行运算符重载，即可以重定义或重载大部分 C++ 内置的运算符。这样，就能使用自定义类型的运算符。重载的运算符是带有特殊名称的函数，函数名是由关键字 operator 和其后要重载的运算符符号构成的。与其他函数一样，重载运算符有一个返回类型和一个参数列表。

python呢，对一个类而言，如果你重新定义了`__add__`函数，就是重载了+运算符。

而julia呢，用的是多重分发，你针对你的类型增加了Base.(+)函数，就是对你的这个类型定义了+运算符。

实际上，我们还可以走得更远一点，仍然在julia的repl中，
```julia
abc = Meta.parse("3+2")
Meta.show_sexpr(abc)
```
来看看内部的代码表示。我们可以发现，julia底层就是类似于scheme的表达。可以粗浅地认为julia是一个高级版的scheme。

核心本质，加减乘除运算符本质都是函数。采用前缀表达式，尽管像四则混合运算这样的情况对眼睛不友好，可是使用函数表达方式，很用户友好。

- **主函数并不是必须的，但运行程序必须有个入口**

我们在学习c或者Fortran的时候，总是从main函数开始的，这其实是编译器的要求。

在julia语言中，如果你用`julia foo.jl`启动你的脚本foo.jl, 那这个foo.jl脚本本身就是你要执行的程序，大逻辑上会按照这个脚本内的内容顺序执行。当然在这个大逻辑框架内部，你可以调用别的函数，或者有循环，有分支等等。

在python语言中，如果我们使用pycharm来开始运行调试，会让你指定调试入口，就是指出从哪个文件开始运行。大逻辑上会按照你的py脚本内的内容顺序执行。但是如果你的py文件前面只是定义了符号、变量、函数等等，实际上是啥也没干。而如果在你的py脚本最后存在`if __name__=="__main__"`语句，则是以本脚本启动的时候，程序入口所在，

```python
def hello():
    print("hello")
if __name__=="__main__"
    hello()
```

而java呢，它是把一个类写成一个.java文件，编译之后，一个.java文件就对应一个.class文件，把一些.class文件打包到一块呢就成了.jar文件。编译的时候，通过Manifest.txt里Main-class指定入口。

对于c，我们甚至可以开脑洞想一想，用lambda定义一个匿名函数，然后把它命名为main，然后编译运行它，（我没有实测过是否可行啊），

```cpp
auto main=[]()->int { printf("hello world");return 0;};
```

总之，主函数并不是必须的，但运行程序必须有个入口。

- **提供给函数的参数需要按约定好的要求**

那我们现在来说说函数的参数。函数的参数就是一种约定，你要我处理一件事，你就得按照我的要求来提供材料。你要发快递，那么，收件人地址、收件人姓名、收件人电话，这就是我提出的要求。函数也一样。你要我计算一个浮点数x对应的sin(x)的值，那你就得按float给我提供这个参数x。

因为数据有类型，所以函数对参数可以表达类型要求。返回值对应的也有类型。

而有些语言是动态类型的，就是不显示的声明类型，运行到这里的时候，是什么类型，就按什么类型给你处理，比如
```julia
function f(x)
    x + 2
end
```

python、julia等是动态类型的。而c/c++、Fortran等语言是静态类型的。

我们在寄件的时候，可以问你要三个参数，收件人地址、收件人姓名、收件人电话，如果我约定的是一个结构化的数据（比如含有上述三个信息的表格），你就可以直接一次给我整个表格。同样的，如果我要你给交一系列的打印文字，你可以一页一页的交给我，也可以装订成若干册交给我。装订（打包）成册，就是以结构化的信息给我提供了所需信息。问题是，你给我提供的信息得按我的要求来。

函数也一样，可以以独立的一个个的浮点数来传递我所需的参数，也可以打包成结构体。取决于定义函数的时候所用的形式，就是取决于函数的要求。甚至，我们曾看到，在Fortran的一个实际程序中，对一个太阳能集热板组件，把所有的输入参数存入一个数组xin，所有的输出参数存入一个数组xout，然后调用对应的subroutine。

```
subroutine solarcollector(xin,xout)
    ...
end
```
总之，一句话，提供给函数的参数需要按约定好的要求，这个约定和要求是在定义函数的时候决定的。

因为计算机是机械化的信息处理，所以最初只能按确定的形式接受。但是人们通过一些办法实现了对人更友好，就可以处理一页一页交过来我能处理，一册一册叫过来我也能处理。某种意义上讲，这就是一种多态。

Julia语言中通过对同一个函数名写不同的处理方法来实现。而c++通过参数形式的不同实现不同的具体的函数，来处理多态问题。这个我们暂时不去深究。

### 函数的集合构成库

- **函数可以封装成库给别人调用，有动态库，有静态库**
我们写函数的本质是把具有一定功能性代码整合起来，可以重复的使用。至于函数内部的实现，你可以认为就是一个黑箱。但是我得告诉你我有什么功能。就像快递收发点一样，怎么运输的你不用管，但是我得有个目录告诉你有些什么选择和对应的收费标准。

c语言中，stdio等库就是这么个情况，把很多有用的函数封装在一起，成为一个库（静态和动态我们等会儿再说），库里有什么则通过stdio.h这个文件告诉你，同时stdio.h也告诉你了要以什么样的参数方式调用。

我们如果使用CLion，创建一个新项目，选择c library，可以产生如下的两个文件，library.h和library.cpp
```cpp
#ifndef TESTD_LIBRARY_H
#define TESTD_LIBRARY_H

void hello();

#endif //TESTD_LIBRARY_H

```
```cpp
#include "library.h"

#include <iostream>

void hello() {
    std::cout << "Hello, World!" << std::endl;
}

```


CLion为了方便我们使用，还产生了项目的 CMakelists.txt文件。
```cmake
cmake_minimum_required(VERSION 3.20)
project(testd)

set(CMAKE_CXX_STANDARD 14)

add_library(testd library.cpp)
```

在Clion中，我们build一下，就产生了对应的libtestd.a文件。



如果我们当初创建c library的时候，选择的是动态链接库，则产生的CMakelists.txt略有不同，
```
add_library(testd SHARED library.cpp)
```
我们build之后呢，产生的则是libtestd.dll文件。

这里我们首先解释一下动态链接库和静态链接库。

从上面的描述我们可以发现，人们可以把一些函数封装成库，提供给用户服务。c语言就有很多这样的库，你写的时候，就可以调用c语言自带的这些库函数。编译的时候，你的c语言源代码会编译成.o文件，但是要做成exe文件，还需要把库里所有要用到的那些函数代码嵌入进来，这种方式就是静态的链接到了你的exe文件中。提供的这些库，就称呼为静态链接库。

而如果某些函数使用率非常的高，或者你自己脑回路清奇，或者乐意，你也可以把那些用到的函数不嵌入进来，只是告诉你的exe程序，需要用到某个库中的某个函数，在运行的时候才加载那个库，调用库里的函数。这样的方式就是动态链接库。

在windows下，静态链接库一般是lib为后缀名，动态链接库一般是dll为后缀名。

在linux下，静态链接库一般是a为后缀名，动态链接库一般是so为后缀名。

在mac os x 下，动态链接库一般是dylib为后缀名。

如果我们有linux系统，我们可以在终端下使用`ldd ls`，来查看ls这个命令运行的时候要用到的动态链接库。如果找不到某个so文件，那么你的程序就无法执行。

那么系统会到哪里去找这些动态链接库和静态链接库呢。先说Linux下的情况。静态的，是编译时要嵌入的，所以如果使用gcc命令行编译，`gcc -I`的部分`-I`后面指定头文件搜索目录，`-L`指定加载的库所在地。动态的，编译的时候，也是需要`-I` `-L`这样的选项指定。还有就是会去系统的两个变量所描述的目录去找。一个是`INCLUDE_PATH`，一个是`LD_LIBRARY_PATH`。而这两个变量系统会维护，你自己也可以对它进行改变。windows下类似，但往往还在当前目录去搜索。如果使用visual studio系列的集成开发环境编程，则在配置中，可以指定使用哪些静态动态链接库，以及它们所在的位置。

静态链接的好说，函数都嵌入到你的exe中了，拷贝到别的电脑上就能用。它的缺点是可执行文件相对较大。动态链接库，除了拷贝你的exe文件过去之外，还得确保在目标机子上，相应的动态链接库也能被找到。

- **函数能跨语言调用**

我们通过c语言写函数，编译成动态链接库（dll或者so），它能被python调用，比如以下是一个软件的程序片段（https://github.com/NREL/REopt_API/blob/master/reo/src/sscapi.py），

```python
class PySSC:

    def __init__(self):
        if sys.platform == 'win32' or sys.platform == 'cygwin':
            # nlaws 201201 Windows is no longer supported (by celery) but is cygwin supported?
            self.pdll = CDLL("ssc.dll")
        elif sys.platform == 'darwin':
            # NOTE: the path of this file must be in DYLD_LIBRARY_PATH
            self.pdll = CDLL("ssc.dylib")
        elif sys.platform == 'linux2' or sys.platform == 'linux':
            # NOTE: the path of this file must be in LD_LIBRARY_PATH
            self.pdll = CDLL('ssc.so')
        else:
            print("Platform of type {} not supported for wind analyses.".format(sys.platform))
    ...

    def version(self):
        self.pdll.ssc_version.restype = c_int
        return self.pdll.ssc_version()
```
它首先根据你系统的不同，加载了对应的动态链接库，然后定义了version函数。你调用这个python版的version函数时，本质是执行了动态链接库中的ssc_version()函数。

dll也可以被julia调用。对dll，Julia 提供简洁且高效的调用方式。Julia 的哲学是 no boilerplate： Julia 可以直接调用 C/Fortran 的函数，不需要任何"胶水"代码，代码生成或其它编译过程。上述特性可以仅仅通过调用 ccall 实现，它的语法看起来就像是普通的函数调用。

被调用的代码必须是一个共享库（.so, .dylib, .dll）。大多数 C 和 Fortran 库都已经是以共享库的形式发布的，但在用 GCC 或 Clang 编译自己的代码时，需要添加 -shared 和 -fPIC 编译器选项。

可以通过(:function, "library") 或 ("function", "library") 这两种形式来索引库中的函数，其中 function 是函数名，library 是库名。（特定平台/操作系统的）加载路径中可用的共享库将按名称解析。 也可以指定库的完整路径。

一个典型的例子如下：
```julia
using Compat
const coolproplibrary = joinpath(@__DIR__, "./CoolProp.dll")

function PropsSI(fluid::AbstractString, output::AbstractString)
    val = ccall( (:Props1SI, coolproplibrary), Cdouble, (Cstring, Cstring), fluid, output)
    if val == Inf
        error("CoolProp: ", get_global_param_string("errstring"))
    end
    return val
end
```
就是通过coolproplibrary标记这个dll文件，然后写一个PropsSI函数，内部调用Props1SI进行处理。

在fortran与c混合编程中，过去进行混合语言编程是比较麻烦的，现在随着Fortran标准的进一步发展，已经很简单了，使用`ISO_C_BINDING`，就好了，下面是<https://github.com/OP-DSL/OPS>中的代码片段，

```
module OPS_Fortran_Declarations

  use, intrinsic :: ISO_C_BINDING
  ...
  integer(c_int) :: OPS_READ = 1
  integer(c_int) :: OPS_WRITE = 2
  integer(c_int) :: OPS_RW = 3
  integer(c_int) :: OPS_INC = 4
  integer(c_int) :: OPS_MIN = 5
  integer(c_int) :: OPS_MAX = 6
  ...
  subroutine ops_reduction_result_real_8 (reduction_handle, var)
    use, intrinsic :: ISO_C_BINDING
    type(ops_reduction) :: reduction_handle
    real(8), dimension(:), target :: var

    call ops_reduction_result_c (reduction_handle%reductionCptr, reduction_handle%reductionPtr%size, c_loc(var))
  end subroutine ops_reduction_result_real_8
  ...
end module OPS_Fortran_Declarations
```
这段代码虽然不能直接就运行检查，但是启发我们，fortran和c互相调用，使用`ISO_C_BINDING`就很简单了。

小结一下，函数能跨语言调用，按照提供（要求）的方法就好。

- **可执行程序就是个函数，但是函数参数的给定方式是命令行参数**
在linux下的shell下，我们知道命令有很多选项，比如`ls`，可以在后面加上选项和参数，比如`ls -l /usr/local`。

在windows下也一样，以`dir`这个命令为例，可以加上选项和参数，`dir /a c:\ `，这里`/a`是选项，`c:\ `是参数。

我们在<https://github.com/wertarbyte/coreutils/blob/master/src/ls.c>看一下ls的源代码，
```c
int
main (int argc, char **argv)
{
    ...
    initialize_main (&argc, &argv);
    ...
    i = decode_switches (argc, argv);
    ...
}
```
这里的argc和argv就是参数（argument, arg）的数量(count,c)和值（value，v）。而decode_switches就是解析出来参数的值，然后根据参数的值确定函数下一步的行为。

有的可能会单独写一个函数来处理命令行参数，类似于这样,
```
#ifdef TRILIBRARY
  parsecommandline(1, &triswitches, &b);
#else /* not TRILIBRARY */
  parsecommandline(argc, argv, &b);
#endif /* not TRILIBRARY */
  m.steinerleft = b.steiner;
```
Fortran也类似，对于Fortran2003及其之后，使用`GET_COMMAND_ARGUMENT`来获取参数
 
```
PROGRAM test_get_command_argument
INTEGER :: i,n
CHARACTER(len=32) :: arg
          
i = 1
DO
CALL get_command_argument(i, arg)
IF (LEN_TRIM(arg) == 0) EXIT
READ(arg,'(I3)') n
WRITE (*,*) n*n
i = i+1
END DO
 
END PROGRAM
```
比如编译后的可执行程序叫testComArg，在终端中输入： `./testComArg 2 3`
将得到:
```
4
9
```

当然python什么的，不外如是。

所以说，可执行程序就是个函数，但是函数参数的给定方式是命令行参数。

- **程序执行时的环境变量也会影响函数的行为**
还需要说的就是，系统运行的时候存在一些平时我们没有注意的一些“变量”，通常称为环境变量。包括，用户名是啥啊，用的shell是啥啊，当前目录是上啊，等等。在命令行提示符下输入`env`回车，你就能看到很多的环境变量。通俗点说呢，就是个变量表。有变量名，有值。linux下也是如此。

某些函数在运行时会询问这个参数表（环境变量表）中某些参数的值，从而确定自己的行为。

比如我们的julia，我们执行`versioninfo()`的时候，可以看到`JULIA_PKG_SERVER = https://mirrors.tuna.tsinghua.edu.cn/julia`，这样，我在进入Pkg模式，添加软件包时，它就会去`JULIA_PKG_SERVER`标记的镜像站点下载。
```julia

julia> versioninfo()
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Windows (x86_64-w64-mingw32)
  CPU: Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake)
Environment:
  JULIA_PKG_SERVER = https://mirrors.tuna.tsinghua.edu.cn/julia
julia>
```

当然的，是这些函数内部要求了要去查某个或者某些环境变量的值，并使用了它。

小结来说，程序执行时的环境变量也会影响函数的行为。

- **函数运行时的“环境”与闭包**

函数调用，形象来讲就是做了个梦，被调用的函数中再调用函数，就是梦中做梦。（你看过电影盗梦空间吗？）

打过游戏的同学可能也有体会，函数调用就是玩游戏时打开了一个门，屏幕黑了一下或者白了一下，进入了一个新的情景，在这个新的情景中还可能会继续下去打开新的密室。

可是你在梦中所携带的工具是进入梦境就给你了的，就是“变量-值”表。打游戏的技能集，就相当于是若干个变量-值对。

我们从一个游戏情景返回到原来的情景，就相当于是函数调用返回。返回回来，情节就接着演啊。这就是进入一层梦境的时候，就把所有的技能集加在最前面，返回的时候就去掉最前面加上去的那些。栈嘛，就是栈。

操作系统，或者说编译器，总之就是底层的那些，在调用的时候，实际上是把函数入口和“环境”（不只是环境变量，还包括你的参数集，一起组成环境）当成一个整体开始进入梦境。当成一个整体就是构成一个结构体，就是当做一个闭包。

关于闭包，更多的可以看看这个，[Lisp 已死，Lisp 万岁！](http://www.yinwang.org/blog-cn/2013/03/26/lisp-dead-alive) 或者yuziwen的[PL教程 第一章 人和机器](https://yuziwen.github.io/pl-tutorial-1.html), “习题：找规律”之前的那一部分内容。

### 由函数构成服务
- **事件驱动与死循环，服务程序**

我们初学编程的时候，老师给我们说，不要写死循环。是的，那时候电脑就给你个黑屏，死循环无法退出，机子就只好重启了。

可是，真的不能写死循环吗？以下来自<https://github.com/APMonitor/arduino/blob/master/0_Test_Device/Python/tclab_v2/tclab_v2.ino>，是一个温度控制小实验板上的程序，arduino上运行的。复制这么长的代码不利于阅读，但是为了完整性，我们还是都贴过来。

```c

#include "Arduino.h"

// determine board type
#if defined(__AVR_ATmega328P__) || defined(__AVR_ATmega168__)
  String boardType = "Arduino Uno";
#elif defined(__AVR_ATmega32U4__) || defined(__AVR_ATmega16U4__)
  String boardType = "Arduino Leonardo/Micro";
#elif defined(__AVR_ATmega1280__) || defined(__AVR_ATmega2560__)
  String boardType = "Arduino Mega";
#else 
  String boardType = "Unknown board";
#endif

// Enable debugging output
const bool DEBUG = false;

// constants
const String vers = "2.0.1";   // version of this firmware
const long baud = 115200;      // serial baud rate
const char sp = ' ';           // command separator
const char nl = '\n';          // command terminator

// pin numbers corresponding to signals on the TC Lab Shield
const int pinT1   = 0;         // T1
const int pinT2   = 2;         // T2
const int pinQ1   = 3;         // Q1
const int pinQ2   = 5;         // Q2
const int pinLED1 = 9;         // LED1

// temperature alarm limits
const int limT1   = 50;       // T1 high alarm (°C)
const int limT2   = 50;       // T2 high alarm (°C)

// LED1 levels
const int hiLED   =  60;       // hi LED
const int loLED   = hiLED/16;  // lo LED

// global variables
char Buffer[64];               // buffer for parsing serial input
int buffer_index = 0;          // index for Buffer
String cmd;                    // command
float val;                     // command value
int ledStatus;                 // 1: loLED
                               // 2: hiLED
                               // 3: loLED blink
                               // 4: hiLED blink
long ledTimeout = 0;           // when to return LED to normal operation
float LED = 100;               // LED override brightness
float P1 = 200;                // heater 1 power limit in units of pwm. Range 0 to 255
float P2 = 100;                // heater 2 power limit in units in pwm, range 0 to 255
float Q1 = 0;                  // last value written to heater 1 in units of percent
float Q2 = 0;                  // last value written to heater 2 in units of percent
int alarmStatus;               // hi temperature alarm status
boolean newData = false;       // boolean flag indicating new command
int n =  10;                   // number of samples for each temperature measurement


void readCommand() {
  while (Serial && (Serial.available() > 0) && (newData == false)) {
    int byte = Serial.read();
    if ((byte != '\r') && (byte != nl) && (buffer_index < 64)) {
      Buffer[buffer_index] = byte;
      buffer_index++;
    }
    else {
      newData = true;
    }
  }   
}

// for debugging with the serial monitor in Arduino IDE
void echoCommand() {
  if (newData) {
    Serial.write("Received Command: ");
    Serial.write(Buffer, buffer_index);
    Serial.write(nl);
    Serial.flush();
  }
}

// return average  of n reads of thermister temperature in °C
inline float readTemperature(int pin) {
  float degC = 0.0;
  for (int i = 0; i < n; i++) {
    degC += analogRead(pin) * 0.322265625 - 50.0;    // use for 3.3v AREF
    //degC += analogRead(pin) * 0.170898438 - 50.0;  // use for 1.75v AREF
  }
  return degC / float(n);
}

void parseCommand(void) {
  if (newData) {
    String read_ = String(Buffer);

    // separate command from associated data
    int idx = read_.indexOf(sp);
    cmd = read_.substring(0, idx);
    cmd.trim();
    cmd.toUpperCase();

    // extract data. toFloat() returns 0 on error
    String data = read_.substring(idx + 1);
    data.trim();
    val = data.toFloat();

    // reset parameter for next command
    memset(Buffer, 0, sizeof(Buffer));
    buffer_index = 0;
    newData = false;
  }
}

void sendResponse(String msg) {
  Serial.println(msg);
}

void sendFloatResponse(float val) {
  Serial.println(String(val, 3));
}

void sendBinaryResponse(float val) {
  byte *b = (byte*)&val;
  Serial.write(b, 4);  
}

void dispatchCommand(void) {
  if (cmd == "A") {
    setHeater1(0);
    setHeater2(0);
    sendResponse("Start");
  }
  else if (cmd == "LED") {
    ledTimeout = millis() + 10000;
    LED = max(0, min(100, val));
    sendResponse(String(LED));
  }
  else if (cmd == "P1") {
    P1 = max(0, min(255, val));
    sendResponse(String(P1));
  }
  else if (cmd == "P2") {
    P2 = max(0, min(255, val));
    sendResponse(String(P2));
  }
  else if (cmd == "Q1") {
    setHeater1(val);
    sendFloatResponse(Q1);
  }
  else if (cmd == "Q1B") {
    setHeater1(val);
    sendBinaryResponse(Q1);
  }
  else if (cmd == "Q2") {
    setHeater2(val);
    sendFloatResponse(Q2);
  }
  else if (cmd == "Q2B") {
    setHeater1(val);
    sendBinaryResponse(Q2);
  }
  else if (cmd == "R1") {
    sendFloatResponse(Q1);
  }
  else if (cmd == "R2") {
    sendFloatResponse(Q2);
  }
  else if (cmd == "SCAN") {
    sendFloatResponse(readTemperature(pinT1));
    sendFloatResponse(readTemperature(pinT2));
    sendFloatResponse(Q1);
    sendFloatResponse(Q2);
  }
  else if (cmd == "T1") {
    sendFloatResponse(readTemperature(pinT1));
  }
  else if (cmd == "T1B") {
    sendBinaryResponse(readTemperature(pinT1));
  }
  else if (cmd == "T2") {
    sendFloatResponse(readTemperature(pinT2));
  }
  else if (cmd == "T2B") {
    sendBinaryResponse(readTemperature(pinT2));
  }
  else if (cmd == "VER") {
    sendResponse("TCLab Firmware " + vers + " " + boardType);
  }
  else if (cmd == "X") {
    setHeater1(0);
    setHeater2(0);
    sendResponse("Stop");
  }
  else if (cmd.length() > 0) {
    setHeater1(0);
    setHeater2(0);
    sendResponse(cmd);
  }
  Serial.flush();
  cmd = "";
}

void checkAlarm(void) {
  if ((readTemperature(pinT1) > limT1) or (readTemperature(pinT2) > limT2)) {
    alarmStatus = 1;
  }
  else {
    alarmStatus = 0;
  }
}

void updateStatus(void) {
  // determine led status
  ledStatus = 1;
  if ((Q1 > 0) or (Q2 > 0)) {
    ledStatus = 2;
  }
  if (alarmStatus > 0) {
    ledStatus += 2;
  }
  // update led depending on ledStatus
  if (millis() < ledTimeout) {        // override led operation
    analogWrite(pinLED1, LED);
  }
  else {
    switch (ledStatus) {
      case 1:  // normal operation, heaters off
        analogWrite(pinLED1, loLED);
        break;
      case 2:  // normal operation, heater on
        analogWrite(pinLED1, hiLED);
        break;
      case 3:  // high temperature alarm, heater off
        if ((millis() % 2000) > 1000) {
          analogWrite(pinLED1, loLED);
        } else {
          analogWrite(pinLED1, loLED/4);
        }
        break;
      case 4:  // high temperature alarm, heater on
        if ((millis() % 2000) > 1000) {
          analogWrite(pinLED1, hiLED);
        } else {
          analogWrite(pinLED1, loLED);
        }
        break;
    }   
  }
}

// set Heater 1
void setHeater1(float qval) {
  Q1 = max(0., min(qval, 100.));
  analogWrite(pinQ1, (Q1*P1)/100);
}

// set Heater 2
void setHeater2(float qval) {
  Q2 = max(0., min(qval, 100.));
  analogWrite(pinQ2, (Q2*P2)/100);
}

// arduino startup
void setup() {
  analogReference(EXTERNAL);
  while (!Serial) {
    ; // wait for serial port to connect.
  }
  Serial.begin(baud);
  Serial.flush();
  setHeater1(0);
  setHeater2(0);
  ledTimeout = millis() + 1000;
}

// arduino main event loop
void loop() {
  readCommand();
  if (DEBUG) echoCommand();
  parseCommand();
  dispatchCommand();
  checkAlarm();
  updateStatus();
}
```

arduino是个单片机。最后一个函数，就相当于是主程序，就是个死循环。
```c
void loop() {
  readCommand();
  if (DEBUG) echoCommand();
  parseCommand();
  dispatchCommand();
  checkAlarm();
  updateStatus();
}```

显然，它就是在那里轮询，问你的命令是啥，然后解析命令，然后分发命令，然后返回状态，然后继续。

事件驱动程序也一样。图形化的窗口，实际上在不断的“询问”你的鼠标，你的键盘输入，基于此做出反应。直到你点了关闭按钮或者退出菜单。

服务器程序也一样。网页服务器程序就是在那里等待你的请求。专业的说法是监听，listen。

那为什么dos时代不让我们写死循环呢？因为没有任务管理器。没有上帝之手从外面关掉它。现在操作系统进步了，多任务的，都有办法。而且现在有些程序运行于沙箱模式，你可以随便玩，但是在外头可以销毁沙箱。



事实上，从函数调用的过程来说，操作系统就是最初的那个“根”函数。（类似于桌面上一堆窗口，你的desktop是哪个根窗口。）当然，操作系统不是一个函数组成的。比喻来说，大体如此。

- c++的函数模板与泛型编程

- 动态类型语言与静态类型语言，及它们的互相靠拢
python的类型提示

## 符号与模型

- 从符号到模型与parser

- 函数的调用就是用它来处理你的模型

- 模型处理与代码生成

- 编译器也是个函数

好，现在是时候说说编译器了。编译器其实也是一个函数，它处理你的源代码（符号），首先是解析源代码（parse）获得这个符号代表的模型，然后对这个模型进行处理，最后以汇编或者机器码的形式输出到文件。

以gcc为例，通常我们的编译过程是这样的，
```c
gcc foo.c
```
如果我们把这个过程放慢，那就是第一步编译到汇编，第二步从汇编到机器码，第三步进行连接，
```
gcc -S foo.c -o foo.asm
gcc foo.asm -o foo.o
gcc foo.o -o foo.exe
```
从c语言代码到汇编代码，就是个解析符号、处理模型、输出模型的过程。

在机器码的基础上发展了汇编语言，在汇编语言的基础上发展了c这样的高级语言。

基于c语言我们开发了应用程序foo，如果把c移植到别的平台上去，就是可以把c编译成另一种平台的汇编代码，那么我们的程序如果没有使用太多的诡异特性的话，一般就能在这种新的平台运行。各管一层。

- **make与makefile以及项目文件**

如果有成千上万个源代码，而且还有互相依赖，这时你修改了某个源代码，那么凡是依赖它的源代码都应该重新编译。一行行的输入
```c
gcc first.c -o first.o
gcc second.c -o second.o
...
```
这是很繁琐的。人们发展了make这个好玩意。它通过makefile确定依赖关系和生成规则，并且根据时间戳，递归的把凡是修改时间比目标代码更新的文件及其依赖于它的文件都重新编译一下。一个典型的makefile长这样，
```
foo.o:foo.c
    gcc foo.c -o foo.o
bar.o:bar.c
    gcc bar.c -o bar.o
myprogram:foo.o bar.o
    gcc foo.o bar.o -o myprogram
```
核心就是，依赖关系+生成规则。而为了适应不同的平台，适应批量的处理，还能定义变量，使用通配符。关于make及makefile可以看看一看此篇文字，不用看的太多，理解makefile描述的就是依赖关系+生成规则就够了。

- **从make，到automake，configure，再到qmake，wmake**

经常碰到的事情是一个程序在不同的平台上编译，使用不同的makefile，因为在makefile中还得说明使用什么编译器，INCLUDE目录在哪里，库文件在哪里。人们总是想偷懒的，所以又发展了自动生成makefile的工具，有什么automake啊，configure啊之类的。所以我们经常在开源软件包中看到readme说明的安装过程像这样，
```
./configure --prefix=/usr/local FC=ifort 
make
make install
```
此外，还有qmake，wmake这些各种古怪稀奇的玩意。qmake是qt搞的，wmake是cfd软件openfoam重度使用的。基本道理都差不多。wmake貌似是会递归的查找当前目录及其子目录，然后在每个目录都去给编译一下。

实际上，visual studio系列也有这么个东西，不过不是makefile+make。它叫项目文件。在一个解决方案下可能有多个项目，每个项目就有个项目文件。如果我们用文本编辑工具打开这个项目文件的话，发现它说描述的是同样的事情，就是依赖关系和生成规则。当然visual studio系列也支持make，有个nmake工具。

- **cmake也是个函数**
那么，能不能根据依赖关系和目标关系自动生成makefile，自动生成项目文件这些呢？你说对了，还真是有。cmake就是这么个工具。它根据CMakelists.txt和你选择的工具链去生成makefile这些，或者生成visual studio需要的项目文件。然后调用你的工具链去编译代码。

从我们前面的理解来看，cmake也是个函数，它的输入就是CMakelists.txt等，然后输出就是你所要的项目文件等。

对c/cpp/fortran系列来说，jetbrains出品的CLion堪称利器。（jetbrains的工具，学术免费，开源开发免费。）

## 递归思想与“事物”的结构

- 斐波拉契数列与递归

- 递归与循环

- 四则混合运算、表达式树与递归

## 解释器给我们的启示与对模型的处理

我们提交一个Add 3 4

- 抽象语法树

- 递归处理是解释器的处理办法

## 抽象与封装

- 结构体，有理数的加减乘除

- 结构体演变为类

- 以类为基础的面向对象编程，封装，继承，多态

- 算法的不依赖于具体的类型
C++的模板类
julia的参数类型

- java的java、class、jar

- julia的多重分发

- go的嵌入体

- 库与头文件、包、模块

- 软件包与生态

- 名字空间

- 硬件的一层又一层抽象
由晶体管构建了门电路，由门电路构建了加法器、寄存器、锁存器，进一步构建了更上层的功能模块。设计cpu的时候，不是在晶体管层面设计的，但是一定有“编译器”一样的东西给打版到能生产的级别上去。这就是硬件的一层又一层抽象。

- 软件的一层又一层抽象

从机器码构建了汇编码，从汇编码构建了c语言这样的高级语言。你使用c这样的高级语言写程序，通常不需要管背后的汇编是怎么回事，更不用管机器码了。这就是一层抽象。基于c可以构建更高级的语言，更加用户友好或者安全。

别人的库，也是一层抽象，你在扫码的时候，并不需要知道在0101层面是怎么工作的。

关于计算机科学入门，这里有一个[大约5小时的40集课程](https://www.bilibili.com/video/BV1EW411u7th?spm_id_from=333.337.search-card.all.click)，可以快速的看一遍。

## 如何进行进一步学习
- 学习一门编程语言，掌握关键语言特性，忽略次要特性
- 注意语言特有的那些区别于其他语言的地方
比如fortran的数组下标是从1开始的，而c是从0开始的，fortran的多维数组按列排列等。
- 编程与算法，sicp与leecode
要想理解编程，走一走sicp这样的内容，要想学算法实现，可能leecode和竞赛编程是合适的参考。
- 食材、调料与大餐
就算了解再多的食材和调料的特性你也不是就成为了厨师，同样的，就算你掌握了所有的语法，你也称不了编程高手。

要想做一盘好菜，一开始也并不需要了解所有的食材和调料。需要做的是观摩厨师做菜、自己亲自去做、请人品鉴，再来一遍。写程序也一样。


- 对用户友好与对机器友好
从0101到汇编到c，再到今天的高级语言，从javascript到typescript，这些都是越来越用户友好，而非机器友好。

## 释疑与参考材料

**图形界面**
- 从gcc、gdb到IDE

- 儿童编程Scratch与背后的code
- 从delphi、C#、QT到浏览器

 [make和makefile介绍](https://seisman.github.io/how-to-write-makefile/)
[make和makefile介绍](https://seisman.github.io/how-to-write-makefile/)，这个不要看太多，理解程序编译过程，makefile描述的是依赖关系和生成规则，操作一下就ok了。

 [yuziwen的博客](https://yuziwen.github.io/)
[yuziwen的博客](https://yuziwen.github.io/)，初学的看一看，理解一下函数、递归和结构体。

 [王垠的博客](http://www.yinwang.org/)
[王垠的博客](http://www.yinwang.org/),很多都可以读一读，尤其是《解谜计算机科学》、《怎样写一个解释器》、《如何掌握所有的语言》，还有《对 Parser 的误解》、《Lisp 已死，Lisp 万岁！》。



 [sicp](https://mitpress.mit.edu/sites/default/files/sicp/index.html)

[sicp](https://mitpress.mit.edu/sites/default/files/sicp/index.html)就是大名鼎鼎的sicp。老实说，我没有看完。大体理解过程抽象（就是函数）、数据抽象（就是结构体、类）就差不多了，最多再理解到复数计算、自动求导计算差不多了。有中文版。

 [sicp-js](https://sourceacademy.org/sicpjs)
[sicp-js](https://sourceacademy.org/sicpjs)是javascript版的sicp，新加坡国立大学一名教教授干的。好处是使用javascript实现，直接在网页上就能运行。其实用javascript入门编程就是好，环境啥的都不用装，有个Chrome，按一下F12就什么都有了。

 [htdp](https://htdp.org/)
[htdp](https://htdp.org/)是经典编程入门书之一，scheme语言的，写得很细。

 [让我们谈谈lambda演算](https://github.com/txyyss/Lambda-Calculus)
[让我们谈谈lambda演算](https://github.com/txyyss/Lambda-Calculus)是王盛颐写的介绍lambda演算的。一般而言，并不需要深入去理解。

 [lisp的本质](https://www.cnblogs.com/jxcia_Lai/archive/2012/10/29/2744226.html) 
[lisp的本质](https://www.cnblogs.com/jxcia_Lai/archive/2012/10/29/2744226.html)我不知道中文的原文最早出现在哪里，这是其英文原文<https://www.defmacro.org/ramblings/lisp.html>。恐怕学了java才看得懂，看不懂也不影响啥。

以上这些书和链接，不用全看，不然就真的回不来了。理解核心要义。而这个要义就在《解谜计算机科学》，在《计算机科学基础班（第三期）报名》的课程大纲里，在《怎样写一个解释器》里。

还有一点要说的，编程和数学是两码事，编程也不是算法，编程入门到能理解解释器就差不多了，算法入门可能就需要刷力扣那些了。