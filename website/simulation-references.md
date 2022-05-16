@def title = "仿真相关参考材料"
@def tags = ["simulation", "references"]

# 仿真相关参考材料

\tableofcontents

## [ascend](https://ascend4.org/)
[ascend](https://ascend4.org/)最初由卡耐基梅隆大学先进过程决策中心（[capd](http://capd.cheme.cmu.edu/) ）开发。现在由澳大利亚国立大学John Pye教授维护。ascend实际上是采用c++开发了一种语言。虽然现在已经不活跃，但是其思想已经在modelica、gproms等软件上得以延续。

## [dwsim](https://dwsim.org/)
[dwsim](https://dwsim.org/)是一个开源的化工流程模拟软件，基于.net开发，序贯模块法。还有些额外的收费模块。

## [modelica](https://modelica.org/)
[modelica](https://modelica.org/)不是一个软件，而是一个语言，用于信息物理系统建模的语言。modelica是非因果关系建模，联立方程法求解。它有很多商业实现，如dymola、同元等，也有开源实现，如[openmodelica](https://openmodelica.org/)。以前jmodelica是开源的，现在停止开源许可了，但是旧版本仍然可用。有很多开源的modelica库，比如法国电力的thermosyspro，比如ibpsa的buildings库等等。<https://impact.github.io/>这里可以查到很多的modelica库。

## [ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl)
[ModelingToolkit.jl](https://github.com/SciML/ModelingToolkit.jl)是sciml组织开发的、非常活跃的julia语言仿真工具包，持续进化中。
