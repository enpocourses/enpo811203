### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 29310f20-749a-11ed-18e5-57e31e26eed7
md"# 使用Pluto来学Julia"

# ╔═╡ ed8d4c46-0f32-4fa2-b86e-71595518f5ca
md"""## Pluto简介
Pluto是很好用的。它跟Jupyter类似，都是交互式的笔记本。

## Pluto的安装
使用julia的包管理工具Pkg，在julia的REPL中输入如下命令就能安装Pluto了：
```julia
using Pkg
Pkg.add("Pluto")

```
## 运行Pluto
运行Pluto也很简单，在julia的REPL中输入如下的命令就可以运行Pluto了：
```
using Pluto
Pluto.run()
```
系统会使用默认的浏览器打开一个网页，Pluto就在这个网页中操作。
"""

# ╔═╡ a4e173d7-5ea6-43b1-9361-b5ac94a51efc
md"""
## julia初体验
我们来尝试运行一些简单的julia代码看看。

*注意：* 如果是在一个cell中运行多行代码，需要使用begin和end把你的代码括起来。
"""

# ╔═╡ f6b3aee7-e52a-47bf-acd0-c6dfea9ffcd1
1+1

# ╔═╡ 2f689ffa-9c82-4f04-9de0-d386276fae65
begin
	1+1
	2+2;
end

# ╔═╡ 817ee23c-1f45-4fae-83f8-bc2e0db4c783
md"""有理数可以用分数形式表示，1/2在julia中写作\"1//2\" """

# ╔═╡ d5890188-bc63-4d12-8633-10866ddbf481
1//2

# ╔═╡ 30bc9e60-965a-4b00-b71b-e6adb7332628
1//2+2//3

# ╔═╡ 20743c23-8115-44cb-ac22-86c6c92300d5
md"""# 字符串"""

# ╔═╡ b0c6619e-2f2c-440f-8455-1f89b5626e1d
s1="I am Mingtao Li"

# ╔═╡ e166d553-1158-4622-b372-89d10e7943b4
s2 = """
I am also a string. 
我是多行字符串
可以
是
很多行
的。
"""

# ╔═╡ 96e0e8d8-3ec2-4a90-8528-3ed1beda904e
md"""*可以用来拼接字符串，也可以使用string() 函数来进行字符串的拼接。"""

# ╔═╡ f4777a0c-e72c-48fc-b309-054d083b060b
s3=s1*s2

# ╔═╡ bf700c32-41ec-4da3-aa62-12b6859dcd3d
md"""你在cell中输入*的时候，右边的livedoc框就出现*这个函数的提示，这还是很好用的。"""

# ╔═╡ 13fd65a9-b484-4de3-a7e0-45ebb59432d8
s4=string(s1,s2)

# ╔═╡ 8518abe0-eeab-4fd9-a6c8-df5e192901ba
md"""我们来看一下s3和s4是不是“相等”,我们使用运算符“==”进行判断。当然“==”和“===”是有差异的，我们这里暂时不展开。需要详细了解差异的的话请查看手册。"""

# ╔═╡ 0a607231-e6ac-4d62-8350-71286acf88f7
s3==s4

# ╔═╡ 2d023956-a044-4c68-8918-3f309e7e81a6
s3===s4

# ╔═╡ ccc89ef4-c7c9-4615-879c-4c0e8b46af2d
md"""## 变量"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.2"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─29310f20-749a-11ed-18e5-57e31e26eed7
# ╟─ed8d4c46-0f32-4fa2-b86e-71595518f5ca
# ╟─a4e173d7-5ea6-43b1-9361-b5ac94a51efc
# ╠═f6b3aee7-e52a-47bf-acd0-c6dfea9ffcd1
# ╠═2f689ffa-9c82-4f04-9de0-d386276fae65
# ╟─817ee23c-1f45-4fae-83f8-bc2e0db4c783
# ╠═d5890188-bc63-4d12-8633-10866ddbf481
# ╠═30bc9e60-965a-4b00-b71b-e6adb7332628
# ╟─20743c23-8115-44cb-ac22-86c6c92300d5
# ╠═b0c6619e-2f2c-440f-8455-1f89b5626e1d
# ╠═e166d553-1158-4622-b372-89d10e7943b4
# ╠═96e0e8d8-3ec2-4a90-8528-3ed1beda904e
# ╠═f4777a0c-e72c-48fc-b309-054d083b060b
# ╟─bf700c32-41ec-4da3-aa62-12b6859dcd3d
# ╠═13fd65a9-b484-4de3-a7e0-45ebb59432d8
# ╠═8518abe0-eeab-4fd9-a6c8-df5e192901ba
# ╠═0a607231-e6ac-4d62-8350-71286acf88f7
# ╠═2d023956-a044-4c68-8918-3f309e7e81a6
# ╠═ccc89ef4-c7c9-4615-879c-4c0e8b46af2d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
