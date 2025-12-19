#!/bin/bash
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
rm -rf feeds/{luci,packages}/{applications,lang,net}/{luci-app-appfilter,luci-app-openclash,luci-app-passwall,luci-app-daed,golang,chinadns-ng,daed,dns2socks-rust,dns2socks,dns2tcp,geoview,hysteria,ipt2socks,lua-neturl,microsocks,mosdns,naiveproxy,nikki,open-app-filter,pdnsd,redsocks2,shadow-tls,shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev,simple-obfs,sing-box,tcping,trojan-plus,trojan,tuic-client,v2ray-core,v2ray-geodata,v2ray-plugin,xray-core,xray-plugin}
git clone --depth 1 -b 25.x --single-branch https://github.com/sbwml/packages_lang_golang.git feeds/packages/lang/golang
