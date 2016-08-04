---
title: 利用Hexo搭建个人博客

date: 2016-08-02 11:10:33 

tags:
- Hexo
toc: true
---



- 建立博客
[官方中文文档](https://hexo.io/zh-cn/docs/)
[常见问题](http://blog.csdn.net/wx_962464/article/details/44786929)
[简单步骤](http://www.zipperary.com/2013/05/28/hexo-guide-2/)
[详细步骤](http://blog.fens.me/hexo-blog-github/)
- 编辑器 
[ST3编辑器](http://jingyan.baidu.com/article/d169e186553155436711d846.html)
[Sublime Text作为Markdown编辑器](http://www.cnblogs.com/IPrograming/p/Sublime-markdown-editor.html)
[ST3编辑器添加到右键](http://blog.gt520.com/comt/152.html)
[添加Sublime Text 3的打开方式](http://jingyan.baidu.com/article/cdddd41c68c32753ca00e157.html)
- 插件
[更换主题和同步](https://zhuanlan.zhihu.com/p/20583019)
[插件](http://www.jianshu.com/p/3e341d86acd2)





>以上是参考资料，其中也遇到很多问题，下面按步骤来 以上是参考资料，其中也遇到很多问题，下面按步骤来 以上是参考资料，其中也遇到很多问题，下面按步骤来

## 准备
- 安装NodeJS
- 安装Hexo


```Bash
npm install hexo-cli –g #安装hexo
npm install hexo-server --save #Hexo 3.0后需要 安装server
#之后配置git环境变量

#初始化博客，进入博客目录
hexo init floder 
cd floder
```


## 修改端口port
floder\node_modules\hexo-server\index.js

## 启动服务
```Bash
hexo generate #生成静态文件,可以省略成hexo g,hexo s,hexo d等等
hexo server
```

## Github配置SSH
[Github配置SSH连接](http://jingyan.baidu.com/article/a65957f4e91ccf24e77f9b11.html)
[Github push失败](http://www.oschina.net/question/780536_121856)
## 创建Github Page项目
## 部署到Github
```Bash
npm install hexo-deployer-git --save #Hexo 3.0后需要安装deploy git
```

- 编辑_config.yml
```
deploy:
  type: git
  repository: https://github.com/zippera/zippera.github.io.git
  branch: master
  #冒号前面有空格
```
 
 
## 设置CNAME
在gh-pages目录新建CNAME文件，写域名进去
然后在域名服务器那里设置就可以了
CNAME README都可以放在Source文件夹下,不然每次部署都会删除的



## 添加文章
```
hexo new "postName"  #新建博文,其中postName是博文题目
# 在source/_posts\postName.md
```



在代码块开始的三点之后加上语言例如CSS，支持的语言将会高亮显示，自定义高亮请修改highlight.js
```C++
//效果
#include <iostream>

using namespace std;

bool isRun(int year){
    if(year%4==0&&year%100!=0)
        return true;
    if(year%400==0)
        return true;
    return false;
}

int main()
{
    int days[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    int year,index;
    cin>>year>>index;
    bool isR=isRun(year);
    if(isR){
        //闰年操作
        days[1]=29;
        for(int i=1;i<12;i++)
            days[i]=days[i]+days[i-1];
        int month;
        for(int i=0;i<12;i++)
            if(index<days[i]){
                month=i+1;
                break;
            }
        cout<<month<<endl<<index-days[month-2]<<endl;
    }
    else{
        //普通年操作
        for(int i=1;i<12;i++)
            days[i]=days[i]+days[i-1];
        int month;
        for(int i=0;i<12;i++)
            if(index<days[i]){
                month=i+1;
                break;
            }
        cout<<month<<endl<<index-days[month-2]<<endl;
    }
    return 0;
}

```


## 常用配置

permalink 这个是用于设置文件的存放规则:year-:month-:day/:title/ 


## 注意
如果页面中出现中文，应以UTF-8无BOM编码格式，所以不要用win自带的记事本，使用** Sublime Text 3 **

由于google在天朝大陆被墙，进入themes\landscape\layout\_partial，打开head.ejs，删掉第31行fonts.googleapis.com的链接。

下载下来jquery-2.0.3.min.js，放到themes\landscape\source\js文件夹中。之后进入themes\landscape\layout\_partial，打开after-footer.ejs，将第17行的路径替换为/js/jquery-2.0.3.min.js。


## 更换主题
```
git clone https://github.com/JamesPan/hexo-theme-icarus.git themes/icarus
npm install -S hexo-generator-json-content #安装插件支持
```
_cinfig.yml ,修改 theme: 要更换的主题名，语言等等
themes/icarus/_cinfig.yml 修改menu名字，logo等等

## 修改markdown中的引用
在主题icarus中的mardown使用引用：>的时候会居中出错，
\themes\icarus\source\css\_partial\article.styl 找到blockquote

```
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


## 配置多说
去多说注册 
themes/icarus/_cinfig.yml 修改duoshuo,加上 刚注册 的二级域名
自己去设置一下头像主题什么的
- 设置头像圆角加转动
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

#ds-reset .ds-avatar img:hover{/*利用hover设置鼠标悬浮在头像时的CSS样式*/
    box-shadow: 0 0 10px #fff; rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);
    -webkit-box-shadow: 0 0 10px #fff; rgba(255,255,255,.6), inset 0 0 20px rgba(255,255,255,1);
    transform: rotateZ(360deg);/*图像旋转360度*/
    -webkit-transform: rotateZ(360deg);
        -moz-transform: rotateZ(360deg);
       }
# 设置多说支持消失
.ds-powered-by{ display: none;}
```

## 设置友情链接
```
# Links 通过links来设置友情链接
links:
  Hexo: http://hexo.io
  foam | 我一直在找寻有你的世界: http://zoufeng.net/
```


## 添加站长统计
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

## 添加小图标
修改themes/icarus/_cinfig.yml favicon

## 添加文章
tags/category:
- Diary
[添加文章的官方文档](https://hexo.io/zh-cn/docs/front-matter.html)


## 为文章添加提纲
toc: true #icarus主题自带toc
可以自行修改\themes\icarus\source\css\_partial\article.styl 找到toc

[为文章添加toc](http://kuangqi.me/tricks/enable-table-of-contents-on-hexo/#淇敼Landscape涓婚鐨別js)




## 写一段简单的脚本
shell脚本，保存为.sh，运行后自动启动git
```
#!/bin/bash 
hexo clean #清除hexo编译文件
hexo g     #重新编译博客
hexo d     #部署博客
```