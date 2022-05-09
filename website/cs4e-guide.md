@def title = "适用于工科的计算入门导引"
@def tags = ["compter science", "guide"]

# 适用于工科的计算入门导引

伴随着物联网、大数据、云计算及三维可视化等技术的发展，在“碳达峰、碳中和”双碳目标驱动下，传统工业领域数字化、智能化已经成为第四次工业革命的重要方向之一，这也是中国制造2025的主攻方向。

未来是万物互联、数字孪生、端边云协同的时代。云、大、智、物、移等等是智慧能源绕不开的内容。从数字化到智能化是一个过程，而智能化是整个框架的核心。云、大、物、移都是IT技术。我们需要对计算机有所了解和认识，并能与行业领域专门知识结合，才能更有利于我们塑造智慧化的未来。

那么，非IT工科专业，计算机如何入门呢？

计算就是机械化的信息处理。这点可以先读一读王垠的[《解谜计算机科学》](http://www.yinwang.org/blog-cn/2018/04/13/computer-science)有个认识和了解。接下来，我们会从函数、递归、模型处理、抽象等几个方面进行介绍。

## 函数

有很多人说，计算机入门最合适的捷径就是编程。很多人的编程是从c语言开始的，一开始就陷入了printf的格式化输入里去。而我们这里高度概括的来讲讲。

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
int fun1()
{
    printf("I am in fun1");
    fun2();
    return 0;
}

int fun2()
{
    printf("I am in fun2");
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

- **函数可以封装成库给别人调用，有动态库，有静态库**
我们写函数的本质是把具有一定功能性代码整合起来，可以重复的使用。至于函数内部的实现，你可以认为就是一个黑箱。但是我得告诉你我有什么功能。就像快递收发点一样，怎么运输的你不用管，但是我得有个目录告诉你有些什么选择和对应的收费标准。

c语言中，stdio等库就是这么个情况，把很多有用的函数封装在一起，成为一个库（静态和动态我们等会儿再说），库里有什么则通过stdio.h这个文件告诉你，同时stdio.h也告诉你了要以什么样的参数方式调用。

我们如果使用CLion，创建一个新项目，选择c library，可以产生如下的两个文件

```c

```

```c

```
CLion为了方便我们使用，还产生了项目的 CMakelist.txt文件。在Clion中，我们build一下，就产生了对应的lib文件。

如果我们当初创建c library的时候，选择的是动态链接库，则产生dll文件。

我们对比两个项目所有不同的文件，就会发现只有cmakelist.txt不同。

这里我们首先解释一下动态链接库和静态链接库。

从上面的描述我们可以发现，人们可以把一些函数封装成库，提供给用户服务。c语言就有很多这样的库，你写的时候，就可以调用c语言自带的这些库函数。编译的时候，你的c语言源代码会编译成.o文件，但是要做成exe文件，还需要把库里所有要用到的那些函数代码嵌入进来，这种方式就是静态的链接到了你的exe文件中。提供的这些库，就称呼为静态链接库。

而如果某些函数使用率非常的高，或者你自己脑回路清奇，或者乐意，你也可以把那些用到的函数不嵌入进来，只是告诉你的exe程序，需要用到某个库中的某个函数，在运行的时候才加载那个库，调用库里的函数。这样的方式就是动态链接库。

在windows下，静态链接库一般是lib为后缀名，动态链接库一般是dll为后缀名。

在linux下，静态链接库一般是a为后缀名，动态链接库一般是so为后缀名。

在mac os x 下，动态链接库一般是dylib为后缀名。

如果我们有linux系统，我们实际上可以使用`ldd ls`，来查看ls这个命令运行的时候要用到的动态链接库。如果找不到某个so文件，那么你的程序就无法执行。

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

dll也可以被julia调用。以下这段文字直接复制自julia中文文档，
>在数值计算领域，尽管有很多用 C 语言或 Fortran 写的高质量且成熟的库都可以用 Julia 重写，但为了便捷利用现有的 C 或 Fortran 代码，Julia 提供简洁且高效的调用方式。Julia 的哲学是 no boilerplate： Julia 可以直接调用 C/Fortran 的函数，不需要任何"胶水"代码，代码生成或其它编译过程 – 即使在交互式会话 (REPL/Jupyter notebook) 中使用也一样. 在 Julia 中，上述特性可以仅仅通过调用 ccall 实现，它的语法看起来就像是普通的函数调用。

> 被调用的代码必须是一个共享库（.so, .dylib, .dll）。大多数 C 和 Fortran 库都已经是以共享库的形式发布的，但在用 GCC 或 Clang 编译自己的代码时，需要添加 -shared 和 -fPIC 编译器选项。由于 Julia 的 JIT 生成的机器码跟原生 C 代码的调用是一样，所以在 Julia 里调用 C/Fortran 库的额外开销与直接从 C 里调用是一样的。[1]

> 可以通过元组 (:function, "library") 或 ("function", "library") 这两种形式来索引库中的函数，其中 function 是函数名，library 是库名。（特定平台/操作系统的）加载路径中可用的共享库将按名称解析。 也可以指定库的完整路径。

> 可以单独使用函数名来代替元组（只用 :function 或 "function"）。在这种情况下，函数名在当前进程中进行解析。这一调用形式可用于调用 C 库函数、Julia 运行时中的函数或链接到 Julia 的应用程序中的函数。

> 默认情况下，Fortran 编译器会进行名称修饰（例如，将函数名转换为小写或大写，通常会添加下划线），要通过 ccall 调用 Fortran 函数，传递的标识符必须与 Fortran 编译器名称修饰之后的一致。此外，在调用 Fortran 函数时，所有输入必须以指针形式传递，并已在堆或栈上分配内存。这不仅适用于通常是堆分配的数组及可变对象，而且适用于整数和浮点数等标量值，尽管这些值通常是栈分配的，且在使用 C 或 Julia 调用约定时通常是通过寄存器传递的。

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

在fortran与c混合编程中，过去进行混合语言编程是比较麻烦的，现在随着Fortran标准的进一步发展，已经很简单了，使用`ISO_C_BINDING`，就好了，下面是https://github.com/OP-DSL/OPS 中的代码片段，

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
这段代码虽然不能直接就运行检查，但是启发我们，fortran和c互相调用，使用iso_c_binding就很简单了。

小结一下，函数能跨语言调用，按照提供（要求）的方法就好。

- **可执行程序就是个函数，但是函数参数的给定方式是命令行参数**
c语言的命令行参数，fortran程序的命令行参数

- **程序执行时的环境变量也会影响函数的行为**

- **函数运行时的“环境”与闭包**
，盗梦空间，打游戏的技能表，栈

- **事件驱动与死循环，服务程序**

- 对死循环程序的控制，任务管理器与上帝之手

- 操作系统就是最初的那个根函数

- c++的函数模板与泛型编程

- 动态类型语言与静态类型语言，及它们的互相靠拢
python的类型提示

## 模型与符号

- 从符号到模型与parser

- 函数的调用就是用它来处理你的模型

- 模型处理与代码生成

- 编译器也是个函数

c语言的编译过程，c编译到汇编，汇编编译到0101，链接，

- 移植、平台与上层无关性

- make与makefile以及项目文件

- 从make，到automake，configure，再到qmake，wmake，以及cmake

- cmake也是个函数



## 递归

- 斐波拉契数列与递归

- 递归与循环

- 四则混合运算、表达式树与递归

## 交互式编程与解释器

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

## 图形界面与低代码开发
- 从gcc、gdb到IDE
- 儿童编程Scratch与背后的code
-从delphi、C#、QT到浏览器



## 如何进行进一步学习
- 学习一门编程语言，掌握关键语言特性，忽略次要特性
- 注意语言特有的那些区别于其他语言的地方
- 编程与算法，sicp与leecode
- 食材、调料与大餐
- 搜索引擎、github

## 再看抽象与封装
- 硬件的一层又一层抽象
- 对用户友好与对机器友好
从javascript到typescript
从0101到汇编到c，再到今天的高级语言
- 软件的一层又一层抽象
从ops说说计算方法与硬件无关性
DSL与库
- 知识的结构
欧几里得几何原本

自然数的定义

让我们谈谈lambda演算

lisp的本质，xml，ant

- 站在巨人的肩膀上

## 不是最后的最后

吾生也有涯，而知也无涯

知识在爆炸，与时俱进

从下到上的学习与从上到下的做事，不同的阶段，框架与细节相结合

学习与成功五要素，学习的能力、学习的驱动力、学习的路径、机缘、持续努力

前进的方法：实践、认识、再实践、再认识