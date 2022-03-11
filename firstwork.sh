#! /usr/bin/bash

## the colors ##
NC='\033[0m'
B='\033[34m'
P='\033[35m'
R='\033[31m'
############################################################


## get data without any extra code ##
hn=$(hostname)
un=$(whoami)
ip=$(hostname -I | awk '{print $1}')
kn=$(uname -r)
############################################################


## get data and refine it ##
getOS=$(sed -n 5p /etc/os-release)
os=${getOS:13:-1}

getUP=$(uptime -p)
up=${getUP:3:-1}

getMR=$(free -m | awk '{print $2}')
fr=${getMR:10} 
tl=${getMR:5:5}

getST=$(df -T -h /home/ | awk '{print $5}')
st=${getST:6}
############################################################


## final prints ##
echo -e "${B} ,&&, &% ${NC}    \e[4m\e[1m$un@$hn\e[0m\e[0m\t"       
echo -e "${B} &&#   &*${NC}    ${B}\e[1mos:\e[0m${NC} $os"     
echo -e "${B}.&&#   &,${NC}    ${B}\e[1mkernal:\e[0m${NC} $kn"       
echo -e "${P}.&&#  %% ${NC}    ${B}\e[1muptime:\e[0m${NC} $up"       
echo -e "${P}.&&# &/  ${NC}    "       
echo -e "${P}.&&&     ${NC}    ${B}\e[1mip:\e[0m${NC} $ip"       
echo -e "${R}.&&#     ${NC}    "  
echo -e "${R} &&%   *#${NC}    ${B}\e[1mdisk(/home):\e[0m${NC} $st""B"    
echo -e "${R} *&&#,(& ${NC}    ${B}\e[1mmemory:\e[0m${NC} $fr \\ $tl"
