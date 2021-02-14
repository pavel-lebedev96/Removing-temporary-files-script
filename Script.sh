#!/bin/bashw    
function find_and_list()    
{    
    local list=`find . -maxdepth 1 -name "*$file_suff" -type f -printf "%f %s\n" 2>/dev/null`    
    local var=    
    if [ -n "$list" ]     
    then    
        echo "$1:"    
        for var in $list    
        do    
            echo "$var"    
        done    
    fi    
    list=`ls`    
    for var in $list    
    do    
        if [ -d $var ]     
        then    
            cd $var    
            find_and_list $var    
            cd ..    
        fi    
    done    
}    
function find_and_remove()    
{    
    find . -name "*$file_suff" -exec rm {} \; 2>/dev/null    
}    
if [ $# -ne 3 ]    
then    
    echo "Error! Incorrect number of arguments"    
    return    
fi    
if [[ ! -d $1 ]]    
then    
    echo "Error! Incorrect data"    
fi    
IFS=$'\n'    
file_dir=$1    
file_suff=$2    
r_time=$3    
while [ 1 ]    
do    
    echo -e "\nstart deleting"    
    cd $file_dir    
    find_and_list $file_dir    
    find_and_remove     
    echo -e "\nfinished"    
    cd ..    
    sleep $r_time    
done