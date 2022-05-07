include("bilibilivideos.jl")

const DATEFMT = dateformat"yyyy-mm-dd HH:MMp"
const TZ = "Asia/Shanghai"

function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end

function hfun_bilibili(params)
  id = params[1]
  trueid = get(videos, id, id)
  aid = getindex(trueid,1)
  bvid = getindex(trueid,2)
  cid = getindex(trueid,3)  

  return """
  <div style="text-align: center;">
  <iframe src="https://player.bilibili.com/player.html?aid=$aid&bvid=$bvid&cid=$cid&page=1&as_wide=1&high_quality=1&danmaku=0&t=0" scrolling="no" border="0" frameborder="no" framespacing="0" width="480" height="360" allowfullscreen="true"></iframe>
  </div>
  """
end