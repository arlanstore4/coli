#!/bin/bash
clear
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# EXP
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://arlanstore.github.io/izin > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://arlanstore.github.io/izin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://arlanstore.github.io/izin | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://arlanstore.github.io/izin | grep $MYIP | awk '{print $3}')
fi
# INFO SERVER 
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
# IP
MYIP=$(curl -sS ipinfo.io/ip)
# DOMAIN 
domain=$(cat /etc/xray/domain)
# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
# =========================================
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m           ⇱ INFORMASI SERVER ⇲                 \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "  $blu✘$ORANGE  ISP        $NC : $ISP"
echo -e "  $blu✘$ORANGE  City    $NC    : $CITY"
echo -e "  $blu✘$ORANGE  Public IP  $NC : $MYIP"
echo -e "  $blu✘$ORANGE  Domain  $NC    : $domain"
echo -e "  $blu✘$ORANGE  Total RAM $NC  : ${totalram}MB"
echo -e "  $blu✘$ORANGE  Time$NC        : $Exp"
echo -e "  $blu✘$ORANGE  Version  $NC   : Singgel Port"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ MENU SCRIPT ⇲                   \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " $blu 01)$NC ADD SSH & OpenVPN                                          "
echo -e " $blu 02)$NC ADD L2TP                                                   "
echo -e " $blu 03)$NC ADD PPTP                                                "
echo -e " $blu 04)$NC ADD SSTP MENU                                                "
echo -e " $blu 05)$NC ADD WIREGUARD                                           "
echo -e " $blu 06)$NC ADD SHADOWSOCKS                                           "
echo -e " $blu 07)$NC ADD SHADOWSOCKSR                                           "
echo -e " $blu 08)$NC ADD VMESS                                                  "
echo -e " $blu 09)$NC ADD VLESS                                              "
echo -e " $blu 10)$NC ADD TROJAN GFW                                        "
echo -e " $blu 11)$NC ADD TROJAN GO                                             "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ MENU SETING ⇲                   \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " $blu 12)$NC CEK SERVICE VPS                                            "
echo -e " $blu 13)$NC PENGATURAN                                                "
echo -e " $blu 14)$NC CEK V2RAY "
echo -e " $blu 15)$NC EDIT PATCH V2RAY "
echo -e " $blu 16)$NC EXIT                                                        "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m           ⇱ SCRIPT BY ARLANSTORE ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
read -p "Select From Options [ 1 - 13 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
l2tpmenu
;;
3)
clear
pptpmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
vmessmenu
;;
9)
clear
vlessmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
running
;;
13)
clear
setmenu
;;
14)
clear
cekv2ray
;;
15)
clear
nano /etc/xray/config.json
;;
16)
clear
exit
;;
*)
clear
menu
;;
esac
