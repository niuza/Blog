#!/bin/bash
echo -e "input commit name"
read answer
git add . 
git commit -m $answer
git push -u origin master
echo -e "Press Any Key To Exit"
read