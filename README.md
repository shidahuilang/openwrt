# langlang
 大灰狼编译库
 默认IP地址：192.168.2.1
 账户：root   密码：空
 
- 开始 ctrl+c 
- 进ssh选择插件 
``` bash
cd openwrt && make menuconfig
```
- 结束ctrl+d

- 云编译需要 [在此](https://github.com/settings/tokens) 创建个token,勾选：repo, workflow，保存所得的key
- 然后在此仓库Settings->Secrets中添加个名字为REPO_TOKEN的Secret,填入token获得的key
- TG通知Settings->Secrets中添加个名字为TELEGRAM_BOT_TOKEN和TELEGRAM_CHAT_ID

## 自动更新固件
首先需要打开 Openwrt 主页,点击系统-TTYD 终端或命令窗,或者使用putty输入openwrt即可进入升级菜单

输入 tools 即可打开工具箱
1. USB 空间扩展------6. 环境修复
2. Samba 设置------- 7. 系统信息监控
3. 端口占用列表-------8. 在线设备列表
4. 硬盘信息----------9. 创建虚拟内存 (swap)
5. 网络检查----------10.更新固件


