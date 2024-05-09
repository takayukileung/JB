#!/bin/sh

wget -O v2ray-geodata-new https://raw.githubusercontent.com/kenzok8/small/master/v2ray-geodata/Makefile

ns_line=$(grep -n 'GEOIP_VER:' v2ray-geodata-new | sed 's/:/ /g' | awk '{print $1}')
nb=$(grep -n 'FILE:=$(GEOSITE_IRAN_FILE)' v2ray-geodata-new | sed 's/:/ /g' | awk '{print $1}')
ne_line=$((nb+1))

os_line=$(grep -n 'GEOIP_VER:' feeds/packages/net/v2ray-geodata/Makefile | sed 's/:/ /g' | awk '{print $1}')
oc=$(grep -n 'FILE:=$(GEOSITE_IRAN_FILE)' feeds/packages/net/v2ray-geodata/Makefile | sed 's/:/ /g' | awk '{print $1}')
oe_line=$((oc+1))
oi_line=$((os_line-1))

sed -n "${ns_line},${ne_line}p" v2ray-geodata-new > v-temp.txt

sed -i -e "${os_line},${oe_line}d" feeds/packages/net/v2ray-geodata/Makefile

sed "${oi_line}r v-temp.txt" feeds/packages/net/v2ray-geodata/Makefile > feeds/packages/net/v2ray-geodata/Makefile_new

mv feeds/packages/net/v2ray-geodata/Makefile_new feeds/packages/net/v2ray-geodata/Makefile

rm -f v-temp.txt && rm -f v2ray-geodata-new



