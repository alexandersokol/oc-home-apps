local aspect = require("aspect")
local component = require("component")
local options = require("options")
local state = require("crafting_state")
local recipes = require("recipes")

local chest = component.proxy(options.chestAddress)

local currentState = state.IDLE

function getRecipeByChestItems()
    local matched = {}
    for i = 1, #recipes do
        if (not findItemInChest(recipes[i].centralItem)) then
            goto continue
        end
        for j = 1, #recipes[i].items do
            local item = recipes[i].items[j]
            if (not findItemInChest(item)) then
                goto continue
            end
        end
        table.insert(matched, recipes[i])
        :: continue ::
    end

    if #matched == 0 then
        -- this logic needs some improvement
        return nil
    else
        return matched[1]
    end
end

function findItemInChest(item)
    items = chest.getAllStacks()
    for i = 1, #items do
        local basic = items[i].basic()
        if (basic.display_name == item.label and basic.qty >= item.count) then
            return true
        end
    end
    return false
end

recipe = getRecipeByChestItems()
if recipe then
    print(recipe.label)
else
    print("No recipes matched")
end



