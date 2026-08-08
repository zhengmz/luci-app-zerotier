# luci-app-zerotier

LuCI for ZeroTier / ZeroTier 的 LuCI 管理界面

- 用于加入 ZeroTier 网络的 LuCI 管理界面
- 使用脚本动态实现 NAT 功能（多子网互连），更具灵活、方便
- 适用于 OpenWrt 官方和 [LEDE](https://github.com/coolsnowwolf/lede)

本项目从 <https://github.com/coolsnowwolf/luci> 拷贝过来

因原项目[不支持且不考虑支持 fw4](https://github.com/coolsnowwolf/luci/pull/230)，所以克隆出来

## Changelog / 更新日志

### v2.2

- 增加 srcnat 配置，实现旁路由模式的子网互连
- 剔除重启 zerotier 服务的功能
- 在配置页面使用 tab 区分常规与高级配置

### v2.1

- 配置页面支持所有选项

### v2.0

从 2.0 开始，此包只做为 zeroiter 包的辅助

- 需要使用用官方的 `packages/zerotier` 来启动 zerotier 服务
- 辅助脚本只实现 NAT 的打开与关闭功能

### v1.1

- 支持官方 OpenWrt 22.03+ 的 fw4 nftables
- 支持官方 OpenWrt 中文使用 `po/zh_Hans`
- 支持在非 luci 目录下也可以编译
- 在使用官方 `imagebuilder` 时，解决[与包 package/zerotier 冲突](https://github.com/coolsnowwolf/luci/pull/172)
- 修复部分问题:
  - restart / reload 无法达到预期
  - 在有静态路由时，停止服务无法删除 src nat 规则

## Depends / 依赖

- zerotier
- luci-compat (For OpenWrt 官方 luci)

## Compile / 编译

```shell
# 进入 OpenWrt SDK 目录，建议使用 Docker，如:
docker run -it -v $PWD/bin:/builder/bin openwrt/sdk:x86-64-22.03.5 bash

# 要更新 feeds
#   - 获取 feeds/luci/luci.mk
#   - 获取依赖包 zerotier 编译信息 (feeds/packages/net)
#   - 获取 feeds/luci/applications 目录
./scripts/feeds update -a

# 拷贝到合适目录，如
git clone --depth=1 https://github.com/zhengmz/luci-app-zerotier.git feeds/luci/applications/luci-app-zerotier

# 加载
./scripts/feeds update -f luci
./scripts/feeds install -p luci -f luci-app-zerotier
make defconfig

# 编译
make package/luci-app-zerotier/compile

# 结果
# 存放在 bin/packages/x86_64/luci 目录
luci-app-zerotier*.ipk
luci-i18n-zerotier-zh-cn*.ipk
```

## Usage / 使用

```shell
# 与 zerotier 服务有冲突，建议禁用，两种方式 (Only For v1.1)

# 1. 使用禁用命令
/etc/init.d/zerotier disable

# 2. 定制固件时增加参数
DISABLED_SERVICES="zerotier"
```

