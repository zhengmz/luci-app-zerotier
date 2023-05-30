# luci-app-zerotier

ZeroTier Manager for LuCI / 适用于 LuCI 的 ZeroTier 管理插件

- 用于管理 zerotier 加入网络
- 并增强功能，实现 NAT 功能，多子网互连
- 适用于 OpenWrt 官方和 LEDE

本项目从 <https://github.com/coolsnowwolf/luci> 拷贝过来

因原项目不支持，而且[不准备支持 fw4](https://github.com/coolsnowwolf/luci/pull/230)，所以克隆出来

增强的功能：

- 支持官方 OpenWrt 22.03+ 的 fw4
- [在使用官方固件生成时，与包 package/zerotier 冲突](https://github.com/coolsnowwolf/luci/pull/172)
- 修复部分问题: restart / reload 无法达到预期

## Depends / 依赖

- zerotier
- luci-compat (For OpenWrt 官方 luci)

## Compile / 编译

```shell
make package/luci-app-zerotier/compile
```

## Usage / 使用

```shell
# 禁用原有 zerotier
/etc/init.d/zerotier disable

# 定制固件时增加参数
DISABLED_SERVICES="zerotier"
```

