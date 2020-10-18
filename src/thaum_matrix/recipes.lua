local aspect = require("aspect")

local recipes = {
    {
        label = "Ихор",
        centralItem = {
            label = "Адская звезда"
        },
        items = {
            {
                label = "Кристалл Края"
            },
            {
                label = "Алмаз"
            },
            {
                label = "Кристалл Нижнего мира"
            },
            {
                label = "Око Эндера"
            }
        },
        aspects = {
            [aspect.spiritus] = 64,
            [aspect.humanus] = 32,
            [aspect.lux] = 32
        }
    }
}

for i = 1, #recipes do
    if (recipes.centralItem.count == nil) then
        recipes.centralItem.count = 1
    end

    for j = 1, #recipes[i].items do
        if recipes[i].items[j].count == nil then
            recipes[i].items[j].count = 1
        end
    end
end

return recipes

