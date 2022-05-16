@def title = "优化相关参考材料"
@def tags = ["optimization", "references"]

# 优化相关参考材料

\tableofcontents

## [NEOS-server](https://neos-server.org/neos/)
[NEOS-server](https://neos-server.org/neos/)是非常有名的求解服务器平台。它提供了很多求解器，并且提供计算服务，可以通过网页形式提交优化任务，也可以使用api方式提交任务。重要的是，很多著名商用求解器都以能登录NEOS为傲。所以要使用商用求解器用于你的课题研究，而课题组又没有钱购买的话，使用NEOS-server是很好的选择。

## [JuMP.jl](https://jump.dev/JuMP.jl/)
[JuMP.jl](https://jump.dev/JuMP.jl/)是采用julia语言的数学规划建模语言（平台），已经事实上流行起来，很好用的。封装了很多求解器界面。**可以用来进行优化学习入门。**

## [PYOMO](http://www.pyomo.org/)
[PYOMO](http://www.pyomo.org/)是采用python语言开发的优化建模平台，最早美国Sandia国家实验室开发。开源免费，有不少求解器界面。在pyomo基础上还有dae模块。美国能源技术实验室的先进能源系统设计工具[IDAES](https://idaes.org/)就基于pyomo开发。


## [SCIP](https://www.scipopt.org/)
[SCIP](https://www.scipopt.org/)是德国[ZIB](https://zib.de/)开发的优化求解器套集。很厉害的。

## [GEKKO](https://github.com/BYU-PRISM/GEKKO)

[apmonitor](http://apmonitor.com/)的python包装版本。apmonitor是个优化套集，底层求解器就是apm.exe（IPOPT+BPOPT），它原始的输入文件是apm为后缀名的文件，同时也提供了python版本界面[apm_python](https://github.com/APMonitor/apm_python)。而[GEKKO](https://github.com/BYU-PRISM/GEKKO)是个更用户友好的建模平台，底层仍是调用apmonitor求解，但是建模更方便。GEKKO建模部分开源，求解部分不开源，但是免费，并且可以商用。求解器还提供了linux版本的可执行文件，还有arm版的可执行文件。

## [OpenMDAO](https://openmdao.org/)
[OpenMDAO](https://openmdao.org/)是多学科分析优化工具，开源，基于python。它支持块模式，就是组件。对每个组件，给出输入参数到输出的计算，同时可以给一个自定义的函数计算jacob矩阵，然后通过组件的关联，就可以对整体系统进行优化求解。NASA用得很多。应该属于序贯模块的范畴。有用来进行拓扑优化的文献例子，也有用来优化机翼翼型的例子。请参考其publication页面。美国可再生能源国家实验室基于[OpenMDAO](https://openmdao.org/)做了风力发电的优化软件OpenFAST。现在[OpenFAST](https://github.com/OpenFAST/)已经是一个独立的github组织。[openfast的老巢在这里](https://github.com/OpenFAST/openfast)。

还要说一句，OpenMDAO有julia界面哦，[OpenMDAO.jl](https://github.com/byuflowlab/OpenMDAO.jl)。

## [midaco](http://www.midaco-solver.com/)

[midaco](http://www.midaco-solver.com/)是一个适用于MINLP的蚁群优化算法，应用非常广泛。其特点在于oracle罚函数。提供了对很多minlp测试问题集的评测。试用版只能用于4个变量的优化，不过商用版价格看上去也可以接受。程序本身是使用c++开发的，提供了不同语言的接口。**其download页面提供的不同语言接口给我们展示了对不同语言写接口的很好的参考**。

## [GAMS](https://www.gams.com/)
[GAMS](https://www.gams.com/)，搞运筹学的都懂，没什么说的。

## 一些求解器
apopt，Ipopt