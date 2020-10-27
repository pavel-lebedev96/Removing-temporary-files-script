1.#!/bin/bashw    
2.function find_and_list()    
3.{    
4.    local list=`find . -maxdepth 1 -name "*$file_suff" -type f -printf "%f %s\n" 2>/dev/null`    
5.    local var=    
6.    if [ -n "$list" ]     
7.    then    
8.        echo "$1:"    
9.        for var in $list    
10.        do    
11.            echo "$var"    
12.        done    
13.    fi    
14.    list=`ls`    
15.    for var in $list    
16.    do    
17.        if [ -d $var ]     
18.        then    
19.            cd $var    
20.            find_and_list $var    
21.            cd ..    
22.        fi    
23.    done    
24.}    
25.function find_and_remove()    
26.{    
27.    find . -name "*$file_suff" -exec rm {} \; 2>/dev/null    
28.}    
29.if [ $# -ne 3 ]    
30.then    
31.    echo "Error! Incorrect number of arguments"    
32.    return    
33.fi    
34.if [[ ! -d $1 ]]    
35.then    
36.    echo "Error! Incorrect data"    
37.fi    
38.IFS=$'\n'    
39.file_dir=$1    
40.file_suff=$2    
41.r_time=$3    
42.while [ 1 ]    
43.do    
44.    echo -e "\nstart deleting"    
45.    cd $file_dir    
46.    find_and_list $file_dir    
47.    find_and_remove     
48.    echo -e "\nfinished"    
49.    cd ..    
50.    sleep $r_time    
51.done