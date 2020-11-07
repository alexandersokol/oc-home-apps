local component = require("component")
local computer = require("computer")
local me = component.me_controller

local DEBUG = false

local sourceTable = {
    matter = {
        label = "§dМатерия",
        name = "dwcity:Materia",
        min = 10000
    }
}

local requestTable = {
    {
        label = "Железная руда",
        name = "minecraft:iron_ore",
        count = 3072,
        sourcePerCraft = 3,
        outputCount = 48,
        source = sourceTable.matter,
        repeats = 3
    },
    {
        label = "Медная руда",
        name = "IC2:blockOreCopper",
        count = 3072,
        sourcePerCraft = 3,
        outputCount = 48,
        source = sourceTable.matter
    },
    --{
    --    label = "Красная руда",
    --    name = "minecraft:redstone_ore",
    --    count = 1536,
    --    sourcePerCraft = 3,
    --    outputCount = 24,
    --    source = sourceTable.matter
    --}
}

local currentPosition = 1
local repeatCount = 0

local solarRequestDelaySec = 60 * 10
local lastSolarRequest = 0

function debug(s)
    if (DEBUG) then
        print(s)
    end
end

while true do

    if currentPosition > #requestTable then
        currentPosition = 1
    end

    local requestItem = requestTable[currentPosition]
    local sourceItem = me.getItemsInNetwork({ name = requestItem.source.name })

    if sourceItem and #sourceItem > 0 then
        local requiredCount = ((requestItem.count / requestItem.outputCount) * requestItem.sourcePerCraft) + requestItem.source.min
        debug("\"" .. requestItem.source.label .. "\" необходимое количество должно быть " .. requiredCount)
        if (sourceItem[1].size > requiredCount) then
            local craftablesList = me.getCraftables({ name = requestItem.name })
            if craftablesList and #craftablesList > 0 then

                local craftable = craftablesList[1]
                local isCanceled, reason = craftable.request(requestItem.count).isCanceled()

                if (isCanceled) then
                    print("\"" .. requestItem.label .. "\" автокрафт не запущен! " .. reason)
                else
                    print("Заказал тебе \"" .. requestItem.label .. "\" " .. requestItem.count .. "шт за \"" .. requestItem.source.label .. "\" " .. ((requestItem.count / requestItem.outputCount) * requestItem.sourcePerCraft) .. "шт")

                    local repeats = 0
                    if requestItem.repeats then
                        repeats = requestItem.repeats - 1
                    end

                    debug("Повторы: " .. repeatCount .. "/" .. repeats)

                    if repeatCount < repeats then
                        repeatCount = repeatCount + 1
                        debug("Повторяю " .. repeatCount .. "раз")
                    else
                        repeatCount = 0
                        currentPosition = currentPosition + 1
                        debug("Крафтим дальше")
                    end
                end

            else
                print("\"" .. requestItem.label .. "\" автокрафт не найден!")
            end

        else
            debug("Недостаточно исходного материала \"" .. requestItem.source.label .. "\"(" .. sourceItem[1].size .. ") для крафта \"" .. requestItem.label .. "\" x" .. requestItem.count)
        end
    else
        print("\"" .. requestItem.source.label .. "\" не найден для крафта " .. requestItem.label)
        currentPosition = currentPosition + 1
    end

    if (computer.uptime() > (lastSolarRequest + solarRequestDelaySec)) then
        local solarCraftableList = me.getCraftables({ label = "Solar Panel" })
        if solarCraftableList and #solarCraftableList > 0 then
            local solarCraft = solarCraftableList[1]
            local isCanceled, reason = solarCraft.request(1000).isCanceled()
            if not isCanceled then
                print("Заказал тебе 1000 панелек")
            end
        end
        lastSolarRequest = computer.uptime()
    end

    os.sleep(5)
end