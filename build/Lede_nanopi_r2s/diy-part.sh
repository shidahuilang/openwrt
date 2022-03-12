#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
#
echo "close_dhcp" > package/base-files/files/etc/closedhcp                                         # 关闭DHCP服务
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i "/uci commit fstab/a\uci commit network" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.ipaddr='192.168.2.1'" $ZZZ                      # IPv4 地址(openwrt后台地址)
sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ                   # IPv4 子网掩码
sed -i "/uci commit network/i\uci set network.lan.gateway='192.168.2.1'" $ZZZ                     # IPv4 网关
sed -i "/uci commit network/i\uci set network.lan.broadcast='192.168.2.255'" $ZZZ                 # IPv4 广播
sed -i "/uci commit network/i\uci set network.lan.dns='114.114.114.114 223.5.5.5'" $ZZZ           # DNS(多个DNS要用空格分开)
sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                              # 去掉LAN口使用内置的 IPv6 管理

# 关闭IPv6 分配长度
sed -i '/ip6assign/d' package/base-files/files/bin/config_generate

sed -i 's/luci-theme-bootstrap/luci-theme-opentomcat/g' feeds/luci/collections/luci/Makefile           
sed -i "s/OpenWrt /大灰狼 $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ         

sed -i "/uci commit system/i\uci set system.@system[0].hostname='OpenWrt-DHL'" $ZZZ               

sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                            # 设置密码为空

sed -i 's/PATCHVER=5.4/PATCHVER=5.15/g' target/linux/rockchip/Makefile


# 修改插件名字
sed -i 's/"aMule设置"/"电驴下载"/g' `grep "aMule设置" -rl ./`
sed -i 's/"网络存储"/"存储"/g' `grep "网络存储" -rl ./`
sed -i 's/"Turbo ACC 网络加速"/"网络加速"/g' `grep "Turbo ACC 网络加速" -rl ./`
sed -i 's/"实时流量监测"/"流量"/g' `grep "实时流量监测" -rl ./`
sed -i 's/"KMS 服务器"/"KMS激活"/g' `grep "KMS 服务器" -rl ./`
sed -i 's/"TTYD 终端"/"命令窗"/g' `grep "TTYD 终端" -rl ./`
sed -i 's/"USB 打印服务器"/"打印服务"/g' `grep "USB 打印服务器" -rl ./`
sed -i 's/"Web 管理"/"Web"/g' `grep "Web 管理" -rl ./`
sed -i 's/"管理权"/"改密码"/g' `grep "管理权" -rl ./`
sed -i 's/"带宽监控"/"监控"/g' `grep "带宽监控" -rl ./`
sed -i 's/"Argon 主题设置"/"Argon设置"/g' `grep "Argon 主题设置" -rl ./`

# 整理固件包时候,删除您不想要的固件或者文件,让它不需要上传到Actions空间
cat >${GITHUB_WORKSPACE}/Clear <<-EOF
rm -rf config.buildinfo
rm -rf feeds.buildinfo
rm -rf sha256sums
rm -rf version.buildinfo
rm -rf manifest
EOF
