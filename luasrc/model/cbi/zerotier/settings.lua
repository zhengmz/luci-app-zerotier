a = Map("zerotier")
a.title = translate("ZeroTier")
a.description = translate("Zerotier is an open source, cross-platform and easy to use virtual LAN")

a:section(SimpleSection).template  = "zerotier/zerotier_status"

t = a:section(NamedSection, "sample_config", "zerotier")
t:tab("main", translate("General options"))
t:tab("more", translate("Advanced options"))
t.anonymous = true
t.addremove = false

--General options
e = t:taboption("main", Flag, "enabled", translate("Enable"))
e.default = 0
e.rmempty = false

e = t:taboption("main", DynamicList, "join", translate('ZeroTier Network ID'))
e.password = true
e.rmempty = false

e = t:taboption("main", Flag, "nat", translate("Auto NAT Clients"))
e.description = translate("Allow zerotier clients access your LAN network")
e.default = 0
e.rmempty = false

e = t:taboption("main", DummyValue, "opennewwindow", translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"Zerotier.com\" onclick=\"window.open('https://my.zerotier.com/network')\" />"))
e.description = translate("Create or manage your zerotier network, and auth clients who could access")

--Advanced options
e = t:taboption("more", Value, "port", translate("Port"))
e.description = translate("Port of zerotier service, default 9993")
e.placeholder = 9993
e.datatype = "and(port,min(1025))"

e = t:taboption("more", TextValue, "secret", translate("Secret"))
e.description = translate("Secret of zerotier client")
e.size = 80

e = t:taboption("more", Value, "local_conf", translate("Local configuration"))
e.description = translate("Path to the local.conf")
e.placeholder = "/etc/zerotier.conf"
e.datatype = "file"

e = t:taboption("more", Value, "config_path", translate("Configuration folder"))
e.description = translate("Persistent configuration folder (for ZT controller mode)")
e.placeholder = "/etc/zerotier"
--allow create
--e.datatype = "directory"

e = t:taboption("more", Flag, "copy_config_path", translate("Copy configuration folder"))
e.description = translate("Copy configuration folder to RAM to prevent writing to flash (for ZT controller mode)")

return a
