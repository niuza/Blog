#!/bin/bash 

hexo clean #清除hexo编译文件
hexo qiniu sync
hexo g     #重新编译博客
hexo d 	