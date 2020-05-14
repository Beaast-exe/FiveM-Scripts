local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "vRP_Armas")

local darArmas = { function(player, choice)
	vRP.prompt({player, "ID do Jogador:", "", function(player, target) 
		if target ~= nil and target ~= "" then
			local nplayer = vRP.getUserSource({tonumber(target)})
			vRP.prompt({player, "ID da Arma:", "", function(player, arma)
				vRPclient.giveWeapons(player, {{
					[arma] = { ammo = 999 }
				}})
			end})
		else
			vRPclient.notify(player, {"~r~Jogador não encontrado!"})
		end
	end})
end, "Dar armas a jogador"}

vRP.registerMenuBuilder({"admin", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
	
		if vRP.hasPermission({user_id,"admin.armas"}) then
			choices["@Pegar Armas"] = darArmas
		end
		add(choices)
	end
end})

RegisterCommand('armas', function(player, args)
	local user_id = vRP.getUserId({player})
    if vRP.hasPermission({user_id,"admin.armas"}) then
		vRP.prompt({player, "ID do Jogador:", "", function(player, target) 
			if target ~= nil and target ~= "" then
				local nplayer = vRP.getUserSource({tonumber(target)})
				vRP.prompt({player, "ID da Arma:", "", function(player, arma)
					vRPclient.giveWeapons(player, {{
						[arma] = { ammo = 999 }
					}})
				end})
			else
				vRPclient.notify(player, {"~r~Jogador não encontrado!"})
			end
		end})
	else
		vRPclient.notify(player, {"~r~Não tens permissão para usar este comando!"})
	end
end)