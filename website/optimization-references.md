@def title = "优化相关参考材料"
@def tags = ["optimization", "references"]

# 优化相关参考材料

\tableofcontents

## [NEOS-server](https://neos-server.org/neos/)
[NEOS-server](https://neos-server.org/neos/)是非常有名的求解服务器平台。它提供了很多求解器，并且提供优化计算服务，可以通过网页形式提交优化任务，也可以使用API方式提交任务。重要的是，很多著名商用求解器都以能登录NEOS为傲。所以**如果要使用某个商用求解器用于你的课题研究，而课题组又没有钱购买的话，使用NEOS-server是很好的选择**。

## [JuMP.jl](https://jump.dev/JuMP.jl/)
[JuMP.jl](https://jump.dev/JuMP.jl/)是采用julia语言的数学规划建模语言（平台），已经在julia生态中流行起来，很好用的。它封装了很多求解器界面。**推荐用来进行优化学习入门**。

## [Optimization.jl](https://optimization.sciml.ai/stable/)
[Optimization.jl](https://optimization.sciml.ai/stable/)是[sciml组织](https://sciml.ai)开发的优化包，它主要是把能找到的优化包都集成到了一起。提供了[BlackBoxOptim.jl](https://github.com/robertfeldt/BlackBoxOptim.jl)、[CMAEvolutionaryStrategy.jl](https://github.com/jbrea/CMAEvolutionStrategy.jl)、[Evolutionary.jl](https://github.com/wildart/Evolutionary.jl)、[Flux.jl](https://galacticoptim.sciml.ai/dev/optimization_packages/flux/)、[GCMAES.jl](https://github.com/AStupidBear/GCMAES.jl)、[MathOptInterface.jl](https://github.com/jump-dev/MathOptInterface.jl)、[MultistartOptimization.jl](https://github.com/tpapp/MultistartOptimization.jl)、[Metaheuristics.jl](https://github.com/jmejia8/Metaheuristics.jl)、[NOMAD.jl](https://github.com/bbopt/NOMAD.jl)、[NLopt.jl](https://github.com/JuliaOpt/NLopt.jl)、[Nonconvex.jl](https://github.com/JuliaNonconvex/Nonconvex.jl)、[Optim.jl](https://github.com/JuliaNLSolvers/Optim.jl)、[QuadDIRECT.jl](https://github.com/timholy/QuadDIRECT.jl)等的接口。所以**主要可用来当作索引，看看都有哪些适合你问题的求解器**，[点击这里一目了然](https://optimization.sciml.ai/stable/#Overview-of-the-Optimizers)。另外一点就是，如果要用到启发式算法，可以先看看[Metaheuristics.jl](https://github.com/jmejia8/Metaheuristics.jl)，而[NLopt.jl](https://github.com/JuliaOpt/NLopt.jl)则是把一些经典的非线性优化整合在一起了。


## [PYOMO](http://www.pyomo.org/)
[PYOMO](http://www.pyomo.org/)是采用python语言开发的优化建模平台，最早由美国Sandia国家实验室开发。开源免费，有不少求解器界面。在pyomo基础上还有dae模块。美国能源技术实验室的先进能源系统设计工具[IDAES](https://idaes.org/)就基于pyomo开发。


## [SCIP](https://www.scipopt.org/)
[SCIP](https://www.scipopt.org/)是德国[ZIB](https://zib.de/)开发的优化求解器套集，很厉害的。看看这新闻：[旷视研究院夺得 NeurIPS 2021 ML4CO 组合优化比赛 Dual task 赛道第一](https://zhuanlan.zhihu.com/p/440726459)。

>本次挑战赛的重点是通过机器学习方法替代现有组合优化求解器中的启发式组件，来达到提升现有的组合优化求解器求解性能的目的。基于开源求解器 SCIP 和它的Python封装 Ecole，本次比赛专门针对组合优化问题中的混合整数线性规划问题 (MILP)进行优化；主办方提供了三个 MILP 数据集，它们来自完全不同的现实问题，参赛者可以针对这三个数据集提交不同的模型。

## [GEKKO](https://github.com/BYU-PRISM/GEKKO)

[apmonitor](http://apmonitor.com/)的python包装版本。apmonitor是个优化套集，底层求解器就是apm.exe（IPOPT+BPOPT），它原始的输入文件是apm为后缀名的文件，同时也提供了python版本界面[apm_python](https://github.com/APMonitor/apm_python)。而[GEKKO](https://github.com/BYU-PRISM/GEKKO)是个更用户友好的建模平台，底层仍是调用apmonitor求解，只是建模更方便。GEKKO建模部分开源，求解部分不开源，但是求解部分也免费，并且可以商用。求解器还提供了linux版本的可执行文件，还有arm版的可执行文件。值得说一点的是[TCLab](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl)也出自[apmonitor公司](http://apmonitor.com/)。**学习控制推荐[TCLab](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl)**。

## [OpenMDAO](https://openmdao.org/)
[OpenMDAO](https://openmdao.org/)是多学科分析优化工具，开源，基于python。它支持块模式，就是组件。对每个组件，给出输入参数到输出的计算，同时可以给一个自定义的函数计算jacob矩阵，然后通过组件的关联，就可以对整体系统进行优化求解。NASA用得很多。应该属于序贯模块的范畴。有用来进行拓扑优化的文献例子，也有用来优化机翼翼型的例子。请参考其publication页面。美国可再生能源国家实验室基于[OpenMDAO](https://openmdao.org/)做了风力发电的优化软件OpenFAST。现在[OpenFAST](https://github.com/OpenFAST/)已经是一个独立的github组织。[openfast的老巢在这里](https://github.com/OpenFAST/openfast)。

还要说一句，OpenMDAO有julia界面哦，[OpenMDAO.jl](https://github.com/byuflowlab/OpenMDAO.jl)。

## [midaco](http://www.midaco-solver.com/)
[midaco](http://www.midaco-solver.com/)是一个适用于MINLP的蚁群优化算法，应用非常广泛。其特点在于oracle罚函数。提供了对很多minlp测试问题集的评测。试用版只能用于4个变量的优化，不过商用版价格看上去也可以接受。程序本身是使用c++开发的，提供了不同语言的接口。其download页面**提供的不同语言接口给我们展示了对不同语言写接口的很好的参考**。

## [GAMS](https://www.gams.com/)
[GAMS](https://www.gams.com/)，搞运筹学的都知道，没什么说的。

## 一些求解器
apopt

IPOPT

[刘明明等发表的《混合整数非线性规划的算法软件及最新进展》](https://xueshu.baidu.com/usercenter/paper/show?paperid=daa8bed8aa068caf80c24d3f9b92d874&site=xueshu_se)。