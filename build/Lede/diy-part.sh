#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件
# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好


export IPv4_ipaddr="192.168.2.1"           # 修改openwrt后台地址(填0为关闭)
export Netmask_netm="255.255.255.0"        # IPv4 子网掩码（默认：255.255.255.0）(填0为关闭)
export Op_name="OpenWrt"                   # 修改主机名称为OpenWrt-123(填0为关闭)

export Router_gateway="192.168.2.1"         # 旁路由设置 IPv4 网关(填0为关闭)
export Lan_DNS="114.114.114.114 223.5.5.5"  # 旁路由设置 DNS(多个DNS要用空格分开)(填0为关闭)
export IPv4_Broadcast="192.168.2.255"       # 设置 IPv4 广播(填0为关闭)
export Close_DHCP="1"                       # 旁路由关闭DHCP功能(1为开,0为关闭)
export Delete_Bridge="0"                    # 旁路由去掉桥接模式(1为开,0为关闭)
export ttyd_Nopassword="0"                  # 设置ttyd免密登录(1为开,0为关闭)

export Package_IPv6helper="1"               # 编译IPV6固件(1为开,0为关闭)
export Remove_IPv6="1"                      # 关闭固件里面所有IPv6选项和IPv6的DNS解析记录(1为开,0为关闭)
export Create_IPV6_interface="1"            # 爱快+OP双系统时,爱快接管IPV6,在OP创建IPV6的lan口接收IPV6信息(1为开,0为关闭)
export OpenClash_branch="master"            # OpenClash代码选择分支（master 或 dev）(填0为不需要此插件)
export OpenClash_Core="1"                   # 编译固件增加OpenClash时,把核心下载好,核心为3MB左右大小(1为开,0为关闭)
export Required_Topic="argon"               # 将bootstrap替换您需要的主题为必选主题,名称必须写对,源码内必须有该主题(填0为关闭)
export Default_Theme="argon"                # 多主题时,选择某主题为默认第一主题 (填写主题名称,填0为关闭)
export Delete_NotRequired="1"               # 个别机型内一堆其他机型固件,删除其他机型的,只保留当前主机型固件(1为开,0为关闭)
export Kernel_Patchver="6.0"                # 更换内核版本,前提是您编译的机型源码内保证有其他内核存在(0为关闭,写上其他表示替换)
export Confidentiality_free="1"             # 设置首次登录后台密码为空（进入openwrt后自行修改密码）(1为开,0为关闭)
export Remove_Firewall="0"                  # 删除DNS强制重定向53端口防火墙规则(1为开,0为关闭)
export Cancel_running="1"                   # 取消路由器每天跑分任务
export AdGuardHome_Core="1"                 # 编译固件增加AdGuardHome时,把核心下载好,需要注意的是一个核心20多MB的,小闪存机子搞不来(1为开,0为关闭)

export Personal_Signature="大灰狼 $(TZ=UTC-8 date "+%Y.%m.%d")"  # 个性签名,你想写啥就写啥，(填0为关闭)



# 修改插件名字
sed -i 's?"aMule设置"?"电驴下载"?g' `grep -Eo '"aMule设置"' -rl ./`
sed -i 's?"网络存储"?"NAS"?g' `grep -Eo '"网络存储"' -rl ./`
sed -i 's?"Turbo ACC 网络加速"?"网络加速"?g' `grep -Eo '"Turbo ACC 网络加速"' -rl ./`
sed -i 's?"实时流量监测"?"流量"?g' `grep -Eo '"实时流量监测"' -rl ./`
sed -i 's?"KMS 服务器"?"KMS激活"?g' `grep -Eo '"KMS 服务器"' -rl ./`
sed -i 's?"TTYD 终端"?"TTYD"?g' `grep -Eo '"TTYD 终端"' -rl ./`
sed -i 's?"USB 打印服务器"?"打印服务"?g' `grep -Eo '"USB 打印服务器"' -rl ./`
sed -i 's?"Web 管理"?"Web管理"?g' `grep -Eo '"Web 管理"' -rl ./`
sed -i 's?"管理权"?"改密码"?g' `grep -Eo '"管理权"' -rl ./`
sed -i 's?"带宽监控"?"监控"?g' `grep -Eo '"带宽监控"' -rl ./`


# 整理固件包时候,删除您不想要的固件或者文件,让它不需要上传到Actions空间(根据编译机型变化,自行调整删除名称)
cat >"$CLEAR_PATH" <<-EOF
packages
config.buildinfo
feeds.buildinfo
openwrt-x86-64-generic-kernel.bin
openwrt-x86-64-generic.manifest
openwrt-x86-64-generic-squashfs-rootfs.img.gz
sha256sums
version.buildinfo
EOF

# 在线更新时，删除不想保留固件的某个文件，在EOF跟EOF之间加入删除代码，记住这里对应的是固件的文件路径，比如： rm -rf /etc/config/luci
cat >>$DELETE <<-EOF
EOF
