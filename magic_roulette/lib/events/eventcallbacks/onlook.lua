--[[
	Description: This file is part of Roulette System (refactored)
	Author: Ly�
	Discord: Ly�#8767
	Adaptado para o Canary:  NvSo#4349
]]

local Constants = dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/lib/core/constants.lua')

--[[local ec = EventCallback
ec.onLook = function(self, thing, position, distance, description)
	if thing:getName() == Constants.ROULETTE_DUMMY_NAME then
		local item = ItemType(thing:getOutfit().lookTypeEx)

		return ('You see %s.\n%s'):format(
			item:getName(),
			item:getDescription()
		)
	end
	return description
end

--ec:register(1)]]   --desativado at� que eu possa consert�-lo
