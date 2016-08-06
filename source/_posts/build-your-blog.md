---
title: Hexo+Github Pages搭建个人博客详细过程

date: 2016-08-02 11:10:33 

tags:
- Hexo
- Blog
categories:
- 编程
toc: true
thumbnail: http://obc2f9adw.bkt.clouddn.com/static/images/%E5%B0%81%E9%9D%A2.jpg
banner: http://obc2f9adw.bkt.clouddn.com/static/images/%E5%B0%81%E9%9D%A2.jpg
---
20160804:
提纲貌似和图片不能一起...有空想个办法让右边栏变成提纲，顺便让搜索框悬浮


20160805:
搞了几天终于把自己的博客搞起来了，有空再完善完善，修改一下背景什么的
有那个菜单修改有空再写写，我想我要去打机了，有空再看看下面



这里把我搭建个人博客的过程贴出来了，如果你不想看我那么杂乱，可以去看详细参考 http://ibruce.info/2013/11/22/hexo-your-blog/
当然，这个博客是基于icarus这个博客做的，具体demo请查看 https://github.com/ppoffice/hexo-theme-icarus
建议使用NexT主题，更简单 http://theme-next.iissnan.com/getting-started.html
配置方面推荐看 http://www.jianshu.com/p/2640561e96f8
{% qnimg 草泥马.gif title:草泥马 alt:我的心情就像... 'class:class1 class2' extend:?imageView2/2/w/600 %}
<!--more-->
## 准备

> 环境： Windows 8.1 x64


- 安装git
- 申请github，下面有配置SSH
- 安装NodeJS
- 安装Hexo
- 安装Markdown编辑器
- [配置git环境变量](http://jingyan.baidu.com/article/9f7e7ec0b17cac6f2815548d.html)
### Git操作
Git的通用操作，可以在本地做好版本控制后，push到Git的服务器,可以是Github
```git
# Create a new repository on the command line
git init 
git add .
git commit -m "first commit"
git remote add origin https://github.com/yourId/repoName.git
git push -u origin master
# Push an existing repository from the command line
```
### Github配置SSH
[Github配置SSH连接](http://jingyan.baidu.com/article/a65957f4e91ccf24e77f9b11.html)

[Github push失败](http://www.oschina.net/question/780536_121856)
### 创建Github Page项目
新建repository不需要符合username.github.io的规则
[应用github pages创建自己的个人博客](http://jingyan.baidu.com/article/ed2a5d1f3732cb09f7be1745.html)
创建成功后在gh-pages分支可以查看项目网页
### 购买域名，配置DNS
购买中文域名去**万网**买，配置DNS请用DNSpod
如果是Pages项目病并不需要DNS解析，放个CNAME文件，设置项目的域名，然后域名解析写Github Pages服务器的ip就可以了，详细请查看Github Pages官方帮助
###　更换域名
更换域名后需要修改：
_config.yml　修改url
多说　更改主页
CNAME　更换域名
README.MD　可能需要换链接

## 创建Hexo博客
### 在本地创建Hexo博客
```Bash
npm install hexo-cli –g #安装hexo
npm install hexo-deployer-git --save #Hexo 3.0后需要安装deploy git
npm install hexo-server --save #Hexo 3.0后需要 安装server
#初始化博客，进入博客目录
hexo init floder 
cd floder
```
**hexo的一些命令**
```Bash
hexo new”postName” #新建文章 #存放在主目录的source下的POST目录下

hexo new page”pageName” #新建页面

hexo generate #生成静态页面至public目录

hexo server #开启预览访问端口（默认端口4000，’ctrl + c’关闭server）

hexo deploy #将.deploy目录部署到GitHub

hexo help # 查看帮助

hexo version #查看Hexo的版本

```
**修改端口port**

floder\node_modules\hexo-server\index.js找到port
**在本地预览hexo博客**
```Bash
hexo generate #生成静态文件,可以省略成hexo g,hexo s,hexo d等等
hexo server
```
### 部署到github
编辑_config.yml
```yml
deploy:
  type: git
  repository: https://github.com/zippera/zippera.github.io.git
  branch: master
  #冒号前面有空格
```

### github常见问题
- git push后在github上文件夹是灰色的？
子文件夹下面有复制下来的仓库，把.git .gitignore文件都删掉，然后重新git add 、git commit、 git push，还是无法push的话先移出文件夹再push删除mode，移回来再push重新建立mode
- 怎么建立删除分支？
```git
#在本地新建一个分支
git branch Branch1
#切换到你的新分支
git checkout Branch1
#将新分支发布在github上
git push origin Branch1
#在本地删除一个分支
git branch -d Branch1
#在github远程端删除一个分支
git push origin :Branch1
```


### 解决冲突问题
mathjax和markdown渲染冲突问题
请使用hexo-renderer-pandoc插件，用pandoc去代替默认的markdown渲染器，完美地解决了这个问题
主题一般支持mathjax公式，没有的话可以安装hexo-mathjax的插件
 
### 设置CNAME和README
- CNAME
在gh-pages目录新建CNAME文件，写域名进去
然后在域名服务器那里设置就可以了
CNAME可以放在Source文件夹下,不然每次部署都会删除的
- README
把README.MD文件的后缀名改成"MDOWN"然后扔到blog/source文件夹下即可，这样hexo不会解析，github也会将其作为MD文件解析

### 添加编辑文章和页面,代码高亮
- 添加文章
```hexo
hexo new "postName"  #新建博文,其中postName是博文题目
# 在source/_posts\postName.md
```

之后我们就可以编辑md文件了，Markdown的语法应该网上有很多吧

- 代码高亮
在代码块开始的时候加语言名例如CSS，支持的语言将会高亮显示
如果是icarus主题，文章设置highlight: androidstudio就可以了，自定义高亮更多选项请看icarus/source/css/_highlight

```C++
//效果
#include 

using namespace std;

bool isRun(int year){
    if(year%4==0&&year%100!=0)
        return true;
    if(year%400==0)
        return true;
    return false;
}

```
- 添加文章标签或者分类等等
tags/category:
- Diary
[添加文章的官方文档](https://hexo.io/zh-cn/docs/front-matter.html)


- 为文章添加提纲
icarus主题自带toc插件，在md文件中插入
toc: true   
可以自行修改\themes\icarus\source\css\_partial\article.styl 找到toc
[为文章添加toc](http://kuangqi.me/tricks/enable-table-of-contents-on-hexo/#淇敼Landscape涓婚鐨別js)
- 添加文首图片
banner
- 为文章添加缩略图
icarus主题自带缩略图插件，在md文件插入
thumbnail: https://example.com/image.jpg  
- 二级分类
```
categories
- a
- b
```

- 不使用模板
layout: false
- 搜索引擎
```
meta:
- name="robots";content="noindex, follow"
```
- 修改文章模板scaffolds
scaffolds目录下的post.md
```
---
title: {{ title }}
date: {{ date }}
tags:
categories:
toc:
thumbnail: http://obc2f9adw.bkt.clouddn.com/static/images/
banner: http://obc2f9adw.bkt.clouddn.com/static/images/
---
{% qnimg 封面.jpg title:封面 alt:有空再完善一下我的博客 'class:class1 class2' extend:?imageView2/2/w/600 %}
```

- 添加categories等等页面
先看看站点_config.yml里面的category_dir是不categories
添加页面
```bash
hexo n page "categories"
```
更改index.md,layout为categories，comments设置评论功能
```
---
title: categories
layout: "categories"
type: "categories"
comments: false
---

```
修改`themes/jacman/_config.yml`文件
``` md
menu:
    分类: /categories
```
---
### 编辑器

如果页面中出现中文，应以UTF-8无BOM编码格式，所以不要用win自带的记事本
这里推荐** Sublime Text 3 **作为Markdown编辑器
也推荐 [小书匠Markdown编辑器](http://markdown.xiaoshujiang.com/)，在线或者离线都能实现实时预览
> 参考：
[ST3编辑器](http://jingyan.baidu.com/article/d169e186553155436711d846.html)
[Sublime Text作为Markdown编辑器](http://www.cnblogs.com/IPrograming/p/Sublime-markdown-editor.html)
[ST3编辑器添加到右键](http://blog.gt520.com/comt/152.html)
[添加Sublime Text 3的打开方式](http://jingyan.baidu.com/article/cdddd41c68c32753ca00e157.html)









## 配置

 修改站点下的_config.yml
### 常用配置

url:填你的域名上去
permalink 这个是用于设置文件的存放规则:year-:month-:day/:title/ 


### 一些修改

- _config.yml编译不通过,yml语法极度严格，不通过往往是冒号后面没有空格问题
- 由于google在天朝大陆被墙，进入themes\landscape\layout\_partial，打开head.ejs，删掉第31行fonts.googleapis.com的链接。

- 下载下来jquery-2.0.3.min.js，放到themes\landscape\source\js文件夹中。之后进入themes\landscape\layout\_partial，打开after-footer.ejs，将第17行的路径替换为/js/jquery-2.0.3.min.js。


### 菜单设置

菜单导航栏设置，配置在主题配置文件下
```yml
menu:
  home: /
  archives: /archives
  categories: /categories
tags: /tags
  commonweal: /404.html
  about: /about
```
新增标签页,使用命令hexo new page tags 并将页面类型设置为tags
```markdown
title: tags
date:2016-04-1922:37:08
type:"tags"
---
```
通常情况下你的标签页并不需要评论框，取消评论代码
```markdown
title: tags
date:2016-04-1922:37:08
type:"tags"
comments:false
---
```

### 更换主题
这里我使用的是icarus主题，下面的一些配置也是根据这个主题来配置
不过我觉得NeXT主题更加多人使用扩展也更多，当然有点审美疲劳了
icarus是由EJS模板来实现的，集成了比较多的插件，因为不是很多人使用所以没有NeXT那么成熟吧
1.开始先复制主题
```bash
git clone https://github.com/JamesPan/hexo-theme-icarus.git themes/icarus
npm install -S hexo-generator-json-content #安装插件支持
```
2.修改主题_cinfig.yml ,修改 theme: 要更换的主题名，语言等等
[icarus主题的官方配置](https://github.com/ppoffice/hexo-theme-icarus/wiki/Theme)

3.icarus主题中修改markdown中的引用
在主题icarus中的mardown使用引用：>的时候会居中出错，
\themes\icarus\source\css\_partial\article.styl 找到blockquote

```yml
    blockquote
        background: #ddd
        border-left: 5px solid #ccc
        padding: 15px 20px
        margin-top: 10px
        border-left: 5px solid #657b83
        background: #f6f6f6
        &:before
            top: 20px
            left: 10px
            color: #e2e2e2
            font-size: 32px;
            font-family: FontAwesome
            text-align: center
            position: absolute
        footer
            font-size: font-size
            margin: line-height 0
            font-family: font-sans
            cite
                &:before
                    content: "—"
                    padding: 0 0.5em
```
### 修改网站小图标
修改themes/icarus/_cinfig.yml 找到favicon

## 修改字体
theme/.../source/vendor/open-sans/fonts/

### 配置多说
1.去多说注册 
2.themes/icarus/_cinfig.yml 修改duoshuo,加上 刚注册 的二级域名
自己去设置一下头像主题什么的
3.去多说个人中心设置自定义CSS
> 记得不要设置解析HTML，可能造成button等属性无法使用自定义CSS

- 设置头像圆角加转动
```CSS
#ds-reset .ds-avatar img{
    width:54px;height:54px; /*设置图像的长和宽*/
    border-radius: 27px;/*设置图像圆角效果,在这里我直接设置了超过width/2的像素，即为圆形了*/
    -webkit-border-radius: 27px;/*圆角效果：兼容webkit浏览器*/
    -moz-border-radius:27px;
    box-shadow: inset 0 -1px 0 #3333sf;/*设置图像阴影效果*/
    -webkit-box-shadow: inset 0 -1px 0 #3333sf;
    -webkit-transition: 0.4s;   
    -webkit-transition: -webkit-transform 0.4s ease-out;
    transition: transform 0.4s ease-out;/*变化时间设置为0.4秒(变化动作即为下面的图像旋转360读）*/
        -moz-transition: -moz-transform 0.4s ease-out;
        }

#ds-reset .ds-avatar img:hover{  /*利用hover设置鼠标悬浮在头像时的CSS样式*/
    box-shadow: 0 0 10px #fff; rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);
    -webkit-box-shadow: 0 0 10px #fff; rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);
    transform: rotateZ(360deg);/*图像旋转360度*/
    -webkit-transform: rotateZ(360deg);
        -moz-transform: rotateZ(360deg);
       }
//设置多说支持消失
#ds-thread .ds-powered-by{display:none!important;}


// 设置发送按钮
#ds-thread #ds-reset .ds-post-button{font-family: ‘微软雅黑’‘Microsoft Yahei’!important;font-weight: bold;font-size:12px;background:#DADADA !important;color:#877CC8 !important;}
 
```
具体参考的CSS：
[WordPress多说评论框各种CSS自定义设置问题收集](http://shenchaofei.cn/duoshuo-comment-box-css-custom/328.html)
[多说圆角主题](http://www.ldstars.com/css3/66.html)
[用CSS3制作漂亮的设计达人留言评论样式 | 设计达人](http://www.shejidaren.com/use-css3-to-create-a-beautiful-comment-ui.html)
[多说自定义CSS动感头像和多说评论显示User Agent的那些小事](http://www.52pojie.cn/thread-355650-1-1.html)

当然你可以去人家的博客查看元素，多说的CSS在head标签里面


4.给多说配置UA

[多说回复后显示浏览器及操作系统信息（Useragent)](http://ssk.91txh.com/209)

 * 上传写好的embed.js
 * 如果是icarus主题，请修改duoshuo.ejs里面的embed.js引用
```javascript
ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//obc2f9adw.bkt.clouddn.com/embed.js';
```
 * 自定义CSS
```CSS
/*多说UA开始*/
span.ua{
    margin: 0 1px!important;
    color:#FFFFFF!important;
    /*text-transform: Capitalize!important;
    float: right!important;
    line-height: 18px!important;*/
}
.ua_other.os_other{
    background-color: #ccc!important;
    color: #fff;
    border: 1px solid #BBB!important;
    border-radius: 4px;
}
.ua_ie{
    background-color: #428bca!important;
    border-color: #357ebd!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_firefox{
    background-color: #f0ad4e!important;
    border-color: #eea236!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_maxthon{
    background-color: #7373B9!important;
    border-color: #7373B9!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_ucweb{
    background-color: #FF740F!important;
    border-color: #d43f3a!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_sogou{
    background-color: #78ACE9!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_2345explorer{
    background-color: #2478B8!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_2345chrome{
    background-color: #F9D024!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_mi{
    background-color: #FF4A00!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_lbbrowser{
    background-color: #FC9D2E!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_chrome{
    background-color: #EE6252!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_qq{
    background-color: #3D88A8!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_apple{
    background-color: #E95620!important;
    border-color: #4cae4c!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.ua_opera{
    background-color: #d9534f!important;
    border-color: #d43f3a!important;
    border-radius: 4px;
    padding: 0 5px!important;
}


.os_vista,.os_2000,.os_windows,.os_xp,.os_7,.os_8,.os_8_1 {
    background-color: #39b3d7!important;
    border-color: #46b8da!important;
    border-radius: 4px;
    padding: 0 5px!important;
}

.os_android {
    background-color: #98C13D!important;
    border-color: #01B171!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.os_ubuntu{
    background-color: #DD4814!important;
    border-color: #01B171!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.os_linux {
    background-color: #3A3A3A!important;
    border-color: #1F1F1F!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.os_mac{
    background-color: #666666!important;
    border-color: #1F1F1F!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.os_unix{
    background-color: #006600!important;
    border-color: #1F1F1F!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
.os_nokia{
    background-color: #014485!important;
    border-color: #1F1F1F!important;
    border-radius: 4px;
    padding: 0 5px!important;
}
```
- [多说优化，高级CSS设置](http://www.joryhe.com/2016-05-30-duoshuo_advance_setting_css.html)


### 设置友情链接
继续修改_config.yml
```yml
# Links 通过links来设置友情链接
links:
  Hexo: http://hexo.io
  foam | 我一直在找寻有你的世界: http://zoufeng.net/
```
## 添加功能
### 添加站长统计
为博客添加统计，我还没做好，先挖个坑吧有空再看哈哈
1.注册CNZZ
web_id在配置之后提供的统计代码里面找
layout 添加文件为cnzz.ejs

```
<% if (theme.cnzz){ %>
Analyse with 
<% } %>
```
/_partial/footer.ejs
```
..PPOffice.<%- partial('cnzz') %>
```

2.[百度统计](http://blog.csdn.net/smallcheric/article/details/51049695)



3.最好使用 [不蒜子](http://ibruce.info/2015/04/04/busuanzi/)


4.LeanCloud


>参考
[为hexo博客添加访问次数统计功能](http://ibruce.info/2013/12/22/count-views-of-hexo/)
[为Hexo Next主题添加热度功能（一）](http://www.iamlj.com/2016/07/add-heat-function-for-hexo/)
[使用LeanCloud平台为Hexo博客添加文章浏览量统计组件 | 心怀畏惧](http://crescentmoon.info/2014/12/11/popular-widget/)
[hexo干货系列：（七）hexo安装统计插件](http://www.cnblogs.com/tengj/p/5365434.html)
[Hexo yilia主题添加网站访客人数统计](http://cighao.com/2015/11/30/add-counter-to-hexo/)
[Hexo的NexT主题个性化：添加文章阅读量](http://www.jeyzhang.com/hexo-next-add-post-views.html)




### 插入视频

直接上传优酷，上传后优酷可以复制通用iframe代码或者HTML代码







### 字数统计

npm install hexo-wordcount --save
[hexo-wordcount](https://www.npmjs.com/package/hexo-wordcount)
### 添加RSS
我觉得现在不需要安装啦，需要的看一下

hexo提供了RSS的生成插件，需要手动安装和设置。步骤如下：

安装RSS插件到本地：npm install hexo-generator-feed

开启RSS功能：编辑hexo/_config.yml，添加如下代码：
plugins:  - hexo-generator-feed

在站点添加链接：
在themes/light/_config.yml中，编辑 rss: /atom.xml

在themes/light/layout/_partial/header.ejs中，ul标签之间，添加一样代码
```html
<li> <a href="/atom.xml">RSS</a> </li>
```
### 添加最近访客
http://www.arao.me/2015/hexo-next-theme-optimize-duoshuo/


### 增加404页面
在source文件夹下面新增404.html
```html
<!DOCTYPE HTML>

<html>

<head>

<title>404 - 牛杂辉的空间</title>



<meta name="description" content="404错误，页面不存在！">

<meta http-equiv="content-type" content="text/html;charset=utf-8;"/>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta name="robots" content="all" />

<meta name="robots" content="index,follow"/>

</head>

<body>

<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone_v6/lostchild/search_children.js" charset="utf-8"></script>

</body>

</html>
```






### 修改页面文章篇数
这个我也没有设置，先占个坑，有空来填
设定首页/归档/标签页面文章的篇数
安装以下插件
hexo-generator-index
hexo-generator-archive
hexo-generator-tag

站点配置文章中设定
```yml
index_generator:
  per_page:5

archive_generator:
  per_page:20
  yearly:true
  monthly:true

tag_generator:
  per_page:10
```
多说评论组件提供热评文章功能, 仅在文章页面显示
站点/主题配置文件中设置
```yml
# 多说热评文章 true 或者 false
duoshuo_hotartical:true
```

## 优化
这些优化我都还没有做，占个坑慢慢搞哈哈
### 写一段简单的脚本
shell脚本，保存为.sh，如果已经安装git和配置git的环境变量之后，在windows环境下直接打开会自动启动git bash
一般用到的部署
```hexo
#!/bin/bash 
hexo clean #清除hexo编译文件
hexo g     #重新编译博客
hexo d     #部署博客
```
上传源文件到git
```bash
git init
git remote add origin git@github.com:niuza/Blog.git 
为远程Git更名为origin之后push源文件到master分支
```
新建文章
```bash
#!/bin/bash
echo -e "input commit name"
read answer
git add . 
git commit -m $answer
git push -u origin master
echo -e "Press Any Key To Exit"
read
```

### 常见插件
支持RSS：npm install hexo-generator-feed --save
生成站点地图：npm install hexo-generator-sitemap --save
生成百度站点地图：npm install hexo-generator-baidu-sitemap --save
HTML 压缩：npm install hexo-html-minifier --save
JavaScript 压缩：npm install hexo-uglify --save
CSS 压缩插件：npm install hexo-clean-css --save
SEO优化：npm install hexo-generator-seo-friendly-sitemap

### 使用七牛做图床

[Hexo七牛同步插件](https://github.com/gyk001/hexo-qiniu-sync)

[七牛图片处理API](http://developer.qiniu.com/code/v6/api/kodo-api/index.html#image)

### 主题的修改
简单介绍了一下如何去修改主题 [Hexo模板系统和pacman的修改](http://www.huangyunkun.com/2014/03/18/hexo_ejs_template/)

修改背景图，添加Fork图标什么的 [Hexo 主题Light修改教程](http://www.jianshu.com/p/70343b7c2fd3)

如果主题里面没有toc插件和归档插件，参考这个修改 [Hexo站点中添加文章目录以及归档](http://www.ituring.com.cn/article/199624)

多说添加最近访客 [动动手指，给你的Hexo站点添加最近访客（多说篇）](http://www.arao.me/2015/hexo-next-theme-optimize-duoshuo/)

添加留言页面，修改title,swiftype站内搜索等等 [动动手指，NexT主题与Hexo更搭哦（基础篇）](http://www.arao.me/2015/hexo-next-theme-optimize-base/)

增加简历类型 [Pacman主题下给Hexo增加简历类型](http://blog.zanlabs.com/2015/01/02/add-resume-type-to-hexo-under-pacman-theme/)

Next主题底部添加自定义信息 [为所有文章底部统一放点什么,就这么简单(易)](http://www.joryhe.com/2016-06-04-simple_to_create_something_to_all_article_of_buttom.html)

修改导航 [HEXO技巧分享-文章列表实现](http://www.joryhe.com/2016-05-17-hexo-series-for-tips-01.html)

添加目录，添加相册 [Hexo折腾记——基本配置篇](https://joway.wang/posts/Hexo/2016-03-18-hexo-base.html)

添加网页特效 [为Hexo Next主题添加哈林摇特效（五）](http://www.iamlj.com/2016/08/add-special-effect-harlem-shake-for-hexo/)

添加音乐播放器 [为Hexo Next主题添加音乐播放器功能（二）](http://www.iamlj.com/2016/07/add-music-player-function-for-hexo/)

添加照片流 [为 Hexo 博客做一个照片流，分享你喜欢的书和电影](
https://yq.aliyun.com/articles/4200)

### 性能优化
性能优化，备份，添加README等等[hexo博客搭建时遇到的一些问题](https://segmentfault.com/a/1190000003710962?_ea=336354)

备份等 [利用git解决hexo博客多PC间同步问题](https://segmentfault.com/a/1190000003710980)



CDN加速，域名解析等等[Hexo博客优化，如何加快你的博客访问速度(精)](http://www.joryhe.com/2016-06-05-hexo_site_seo_speed_more_optimization.html#)



详细的优化 [分类: HEXO优化 | JORY'S BLOG](http://www.joryhe.com/categories/ittech/%E7%BD%91%E7%AB%99%E6%8A%80%E6%9C%AF/hexo/HEXO%E4%BC%98%E5%8C%96/)

一些技巧 [分类: HEXO进阶 | JORY'S BLOG](http://www.joryhe.com/categories/ittech/%E7%BD%91%E7%AB%99%E6%8A%80%E6%9C%AF/hexo/HEXO%E8%BF%9B%E9%98%B6/)

压缩，预加载，SEO优化 等等 [Hexo折腾记——性能优化篇](https://yq.aliyun.com/articles/8608)

自动部署到七牛和Github [Hexo 折腾记——自动部署篇](https://joway.wang/posts/Hexo/2016-03-19-Hexo-deploy.html)

多说优化 [多说评论不稳定，加载速度慢优化方法](http://www.arao.me/2015/make-duoshuo-faster-qiniu-cdn/)

[一个Shell脚本方便你的Hexo博客写作 - 推酷](http://www.tuicool.com/articles/3muYraF)


### 部署到个人VPS
Hexo运行在VPS的在线写作 [Hexo在线运行](http://xhay1122.com/2016/02/26/2016-02-26-HexoToOnline/#more)

[利用Travis CI 让你的github项目持续构建(Node.js为例)](http://www.cnblogs.com/whitewolf/archive/2013/04/14/3019838.html)

[使用 Git Hook 自动部署 Hexo 到个人 VPS ](http://www.swiftyper.com/2016/04/17/deploy-hexo-with-git-hook/)



## 工具与参考
### 推荐工具
取色工具：TakeColor 8.0 CN
笔记同步工具：为知笔记
七牛图床：http://yotuku.cn/
### 常用网站
[图标下载，ICON(PNG/ICO/ICNS)图标搜索下载 | EASYICON.NET](http://www.easyicon.net/)

[FontAwesome图标CSS样式参考](http://www.yeahzan.com/fa/facss.html)
### 制作工具
[favicon制作 - 在线工具](http://tool.lu/favicon)
[MakePic.com](http://www.makepic.com/email.php)
[Web2.0 - Logo Creatr](http://creatr.cc/creatr/)
### 参考
[官方中文文档](https://hexo.io/zh-cn/docs/)
[常见问题](http://blog.csdn.net/wx_962464/article/details/44786929)
[简单步骤](http://www.zipperary.com/2013/05/28/hexo-guide-2/)
[详细步骤](http://blog.fens.me/hexo-blog-github/)
[更换主题和同步](https://zhuanlan.zhihu.com/p/20583019)
[插件](http://www.jianshu.com/p/3e341d86acd2)
### 不错的博客
[James Pan's Blog](https://blog.jamespan.me)
[Jing's Blog](http://www.iamlj.com/)
[SHOW TIME](http://www.yuedongxu.cn/)
[winwill2012博客github备份](https://github.com/winwill2012/hexo)
[谈一下我的博客](http://lishichao.com/2016/04/13/%E8%B0%88%E4%B8%80%E4%B8%8B%E6%88%91%E7%9A%84%E5%8D%9A%E5%AE%A2/)

