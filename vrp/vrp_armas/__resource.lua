dependency "vrp"
description "vRP - Dar Armas pelo Menu de Admin"

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua"
}

server_scripts {
  "@vrp/lib/utils.lua",
  "server.lua"
}
