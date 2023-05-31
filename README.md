# luci-app-zerotier

ZeroTier Manager for LuCI / 适用于 LuCI 的 ZeroTier 管理插件

- 用于管理 zerotier 加入网络
- 使用脚本动态实现 NAT 功能（多子网互连），更具灵活、方便
- 适用于 OpenWrt 官方和 LEDE

本项目从 <https://github.com/coolsnowwolf/luci> 拷贝过来

因原项目[不支持且不考虑支持 fw4](https://github.com/coolsnowwolf/luci/pull/230)，所以克隆出来

增强的功能：

- 支持官方 OpenWrt 22.03+ 的 fw4 nftables
- 在使用官方 `imagebuilder` 时，解决[与包 package/zerotier 冲突](https://github.com/coolsnowwolf/luci/pull/172)
- 修复部分问题: restart / reload 无法达到预期

## Depends / 依赖

- zerotier
- luci-compat (For OpenWrt 官方 luci)

## Compile / 编译

```shell
# 进入 OpenWrt SDK 目录，建议使用镜像如 openwrt/sdk:x86-64-22.03.5

# 要更新 feeds，获取 feeds/luci/applications 目录
./scripts/feeds update -a

# 拷贝到合适目录，如
git clone --depth=1 https://github.com/zhengmz/luci-app-zerotier.git feeds/luci/applications/luci-app-zerotier

# 安装 luci-app-zerotier
./scripts/feeds update -p luci
./scripts/feeds install -p luci -f luci-app-zerotier
make defconfig

# 编译
make package/luci-app-zerotier/compile

# 结果存放在 bin/packages/x86_64/base 目录
# 有两个文件
luci-app-zerotier*.ipk
luci-i18n-zerotier-zh-cn*.ipk
```

## Usage / 使用

```shell
# 与 zerotier 服务有冲突，建议禁用，两种方式

# 1. 使用禁用命令
/etc/init.d/zerotier disable

# 2. 定制固件时增加参数
DISABLED_SERVICES="zerotier"
```

