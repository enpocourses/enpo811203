# 课程网站文档

本文档是[智慧能源实践之路课程](https://msoc.ai4energy.org)的网站说明。

网站的源代码在`website/` 目录。需要使用[Franklin.jl](https://franklinjl.org/)来生成网站的内容。

 进入`website/`目录，启动Julia，然后运行如下的命令安装Franklin
```julia
using Pkg
Pkg.add("Franklin")
```

进一步在Julia交互式解释器下运行如下命令启动本地网站服务

```julia
using Franklin
serve()
```

然后就可以使用浏览器通过[`http://localhost:8000/`](http://localhost:8000/)来访问本地网站内容了。