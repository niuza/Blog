#!/bin/bash 
echo -e "请输入文章名字"
read name
hexo new $name
echo -e "好 了"
read