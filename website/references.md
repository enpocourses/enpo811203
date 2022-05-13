@def title = "参考资料"
@def tags = ["reference"]

# 参考资料

## 优化相关

### [NEOS-server](https://neos-server.org/neos/)
[NEOS-server](https://neos-server.org/neos/)是非常有名的求解服务器平台。它提供了很多求解器，并且提供计算服务，可以通过网页形式提交优化任务，也可以使用api方式提交任务。重要的是，很多著名商用求解器都以能登录NEOS为傲。所以要使用商用求解器用于你的课题研究，而课题组又没有钱购买的话，使用NEOS-server是很好的选择。

### [JuMP.jl](https://jump.dev/JuMP.jl/)
[JuMP.jl](https://jump.dev/JuMP.jl/)是采用julia语言的数学规划建模语言（平台），已经事实上流行起来，很好用的。封装了很多求解器界面。

### [PYOMO](http://www.pyomo.org/)

### [SCIP](https://www.scipopt.org/)
德国zib开发的优化求解器套集。

### [GEKKO](https://github.com/BYU-PRISM/GEKKO)

[apmonitor](http://apmonitor.com/)的python包装版本。apmonitor是个优化套集，底层求解器就是apm.exe（IPOPT+BPOPT），它原始的输入文件是apm为后缀名的文件，同时也提供了python版本界面[apm_python](https://github.com/APMonitor/apm_python)。而[GEKKO](https://github.com/BYU-PRISM/GEKKO)是个更用户友好的建模平台，底层仍是调用apmonitor求解，但是建模更方便。GEKKO建模部分开源，求解部分不开源，但是免费，并且可以商用。求解器还提供了linux版本的可执行文件，还有arm版的可执行文件。

### [OpenMDAO](https://openmdao.org/)
有julia界面，OpenMDAO.jl。
----
### [midaco](http://www.midaco-solver.com/)
[midaco](http://www.midaco-solver.com/)是一个适用于MINLP的蚁群优化算法，应用非常广泛。其特点在于oracle罚函数。提供了对很多minlp测试问题集的评测。试用版只能用于4个变量的优化，商用版价格看上去也可以接受。程序本身是使用c++开发的，提供了不同语言的接口。其download页面提供的不同语言接口给我们展示了对不同语言写接口的很好的参考。

### [GAMS](https://www.gams.com/)
运筹学的老大。没什么说的。

## 仿真相关
### [ascend](https://ascend4.org/)
[ascend](https://ascend4.org/)最初由卡耐基梅隆大学先进过程决策中心（[capd](http://capd.cheme.cmu.edu/) ）开发。实际上是采用c++开发了一种语言。虽然现在已经不活跃，但是其思想已经在modelica、gproms等软件上得以延续。

### [dwsim]

### [modelica]

### [modelingtoolkit]
非常活跃的julia语言仿真工具包，持续进化中。

## 建模相关


## 控制相关

### [TCLab温度控制实验室](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl)
[TCLab温度控制实验室](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl)是一个实践性的控制学习的平台。非常非常推荐。硬件采用一个arduino板子，上面做了个增强板，增强板上是2个加热三极管，2个测温三极管，还有1个LED灯。通过usb连接电脑。可以在电脑上学习、测试、运行控制程序。电脑端可使用的语言包括python、matlab、java等。能够实践的控制包括PID、模型预测控制等。其底层的求解程序是apmonitor，就是apm.exe。通过这个平台，可以学习如何针对arduino写程序、可以学习如何进行参数估计、如何进行各种控制实验。而且，稍有点领悟力的人很容易就知道，把usb替换成物联网数据传输的话，就是一个数字孪生体。硬件在亚马逊有卖，不买硬件的话，当它是个刚性仿真体，也可以学习。

## 符号计算相关
### [CasADi]
有julia界面CasADi.jl。
[sympy]
[symbolics.jl]

## 能源领域细分领域相关


<!-- 
AnyMOD.jl

apopt
arduino


Catalyst.jl
CellMLToolkit.jl
CoupledODETools.jl
cvxopt
cyres
dymos
EnergyBasedModels.jl
EnergyModels.jl
EnergyPlus
EnergySystemModeling.jl
EPANET
FOQUS
GasModels.jl
GasNetworkOptimization

GlobalEnergyGIS
idaes-pse
indico-slac
InfrastructureModels.jl
InfrastructureSystems.jl
Ipopt
JuliaFEM.jl
JuliaFMI
jupyter-CAF-kernel

MINLPinstances
MINLPLib.jl
modelica-json
ModelingToolkit.jl

mystic
nlpy
Numberjack

pagmo2
Plasmo.jl
PlasmoCompute.jl
PowerGraphics.jl
PowerModels.jl
PowerSimulations.jl
PowerSystems.jl
PowerSystemsTestData
PSA.jl
pyipopt
pykrylov
REoptLite
SBML2Julia
SBMLToolkit.jl
SIIPExamples.jl
Sims.jl
SmoWeb
soep
SolarResourceModelsandTools
spine-project.org
WaterModels.jl
WaterSystems.jl
WNTR
-->
