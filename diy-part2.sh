#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate
PKGS=(
  luci-app-openlist luci-app-openclash luci-app-passwall luci-app-daed golang chinadns-ng daed dns2socks-rust dns2socks dns2tcp geoview
  hysteria ipt2socks lua-neturl microsocks mosdns naiveproxy nikki openlist pdnsd redsocks2 shadow-tls shadowsocks-libev shadowsocks-rust shadowsocksr-libev simple-obfs sing-box
  tcping trojan-plus trojan tuic-client v2ray-core v2ray-geodata v2ray-plugin xray-core xray-plugin
)
for pkg in "${PKGS[@]}"; do
  find feeds/luci -type d -name "$pkg" -exec rm -rf {} +
  find feeds/packages -type d -name "$pkg" -exec rm -rf {} +
done
git clone -b 25.x --single-branch https://github.com/sbwml/packages_lang_golang.git feeds/packages/lang/golang
./scripts/feeds update -a && ./scripts/feeds install -a
