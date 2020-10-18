local aspect = require("aspect")

local recepies = {
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

return recepies

