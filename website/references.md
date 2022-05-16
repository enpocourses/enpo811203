@def title = "参考资料"
@def tags = ["reference"]

# 参考资料


## 控制相关

### [TCLab温度控制实验室](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl)
[TCLab温度控制实验室](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl)是一个实践性的学习控制的平台。**学习自动控制非常非常推荐**。硬件采用一个arduino板子，上面做了个增强板，增强板上是2个加热三极管，2个测温三极管，还有1个LED灯。通过usb连接电脑。可以在电脑上学习、测试、运行控制程序。电脑端可使用的语言包括python、matlab、java等。能够实践的控制包括PID、模型预测控制等。其底层的求解程序是apmonitor，就是apm.exe。通过这个平台，可以学习如何针对arduino写程序、可以学习如何进行参数估计、如何进行各种控制实验。而且，稍有点领悟力的人很容易就知道，把usb替换成物联网数据传输的话，就是一个数字孪生体。硬件在亚马逊有卖，不买硬件的话，当它是个刚性仿真体，也可以学习。

## 符号计算相关

### [CasADi](https://web.casadi.org/)
[CasADi](https://web.casadi.org/)是c++写的符号计算包，它本身定位并不是一个完整的计算代数包，它的目的是为了非线性优化和自动微分。基于它有很多学术界和工业界的应用。有很多模型预测控制的例子。有人为它写了julia界面[CasADi.jl](https://github.com/ichatzinikolaidis/CasADi.jl)。

### [Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl)
[Symbolics.jl](https://github.com/JuliaSymbolics/Symbolics.jl)是julia语言下的符号计算包。功能非常强大。有很多的julia包基于Symbolics.jl。Symbolics.jl对完成自动微分、符号计算、优化模型构建等非常有帮助。

### [SymPy](https://www.sympy.org/en/index.html)
[SymPy](https://www.sympy.org/en/index.html)是python语言下的符号计算包。我没有深入研究过。只是为了方便python用户列出在这里。

## 能源细分领域相关
EPANET
EnergyPlus和openstudio



## Julia资源传送门

1. [Julia中文文档](https://cn.julialang.org/)
2. [Julia官方文档](https://julialang.org/)
3. [Sciml总站](https://sciml.ai/)
4. [ModelingToolkit.jl](https://mtk.sciml.ai/stable/)（符号建模包）
5. [DifferentialEquations.jl](https://diffeq.sciml.ai/dev/)（常微分方程求解包）
6. [NeuralPDE.jl](https://neuralpde.sciml.ai/stable/)（偏微分方程求解包）
7. [Symbolics.jl](https://symbolics.juliasymbolics.org/dev/)（MTK依赖的符号求解包）
8. [JuMP.jl](https://jump.dev/JuMP.jl/stable/)（优化求解器包）
9. [DiffEqParamEstim.jl](https://diffeqparamestim.sciml.ai/dev/)（基于DE的参数辨识包）
10. [Plots.ji](https://docs.juliaplots.org/dev/)（可视化包）
11. [CSV.jl](https://csv.juliadata.org/stable/)
12. [DataFrames.jl](https://dataframes.juliadata.org/stable/)（大规模数据批量处理包）
13. [Unitful](https://painterqubits.github.io/Unitful.jl/stable/)（单位计算包）
14. [GalacticOptim.jl](https://galacticoptim.sciml.ai/dev/)(Sciml优化包)
15. 

## 其它资源传送门

1. [CoolProp](http://www.coolprop.org/index.html)
2. [APMonitor-github](https://github.com/APMonitor/)
3. [APMonitor](http://apmonitor.com/)
4. [Greet](https://greet.es.anl.gov/)
5. [Mqtt系列教程](https://www.hangge.com/blog/cache/detail_2347.html)
6. [Mixed Integer Distributed Ant Colony Optimization(midaco-solver)](http://www.midaco-solver.com/)


<!-- 
AnyMOD.jl


arduino


Catalyst.jl
CellMLToolkit.jl
CoupledODETools.jl
cvxopt
cyres
dymos
EnergyBasedModels.jl
EnergyModels.jl

EnergySystemModeling.jl

FOQUS
GasModels.jl
GasNetworkOptimization

GlobalEnergyGIS

indico-slac
InfrastructureModels.jl
InfrastructureSystems.jl

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
