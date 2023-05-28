# Magic Roulette for Canary Original created by Lyu
![roulette](https://user-images.githubusercontent.com/40324910/236821618-63cb56a4-3003-4156-a05f-02375649fe55.gif)
## Dependencies
#### Class Helper (lib/core/class.lua)
https://gist.github.com/lyuz1n/6ef834507fbbeb57040ea5a325af6cbb
#### creature:setSpeed method (add to your source) no Canary
https://gist.github.com/Corlyone/f166260c3a471d1e3cfde6c57f321ecc
#### uuid function (add to data/global.lua)
```lua
local random = math.random
function uuid()
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end
```

## OnLook (temporary fix) function for Canary
search for (data/events/scripts/player.lua)

```lua
function Player:onLook(thing, position, distance)
	local description = "You see "
```

then replace for:

```lua
local Constants = dofile(DATA_DIRECTORY .. '/scripts/magic_roulette/lib/core/constants.lua')

function onRouletteLook(thing, position, distance, description)
	if thing:getName():lower() == Constants.ROULETTE_DUMMY_NAME then
		local item = ItemType(thing:getOutfit().lookTypeEx)

		return ('You see %s.\n%s'):format(
			item:getName(),
			item:getDescription()
		)
	end
	return description
end

function Player:onLook(thing, position, distance)
	local description = "You see "
	description = onRouletteLook(thing, position, distance, description)
```