local component = require("component")
local me = component.me_controller
local term = require("term")

local ITEM_NAME = "dwcity:Materia"
local ITEM_LABEL = "§dМатерия"

local rate = 0.0
local history = {}
local previousValue = 0
local tickCount = 0

while true do
    local itemList = me.getItemsInNetwork({ name = ITEM_NAME })
    if itemList and #itemList > 0 then
        local item = itemList[1]

        if previousValue == 0 then
            tickCount = tickCount + 1
        elseif previousValue < item.size then
            tickCount = tickCount + 1
            rate = item.size - previousValue
            table.insert(history, rate)

            local sum = 0
            for a,b in pairs(history) do
                sum = sum + b
            end

            term.clear()
            print("Rate: " .. rate)
            print("Total Rate: " .. (sum / #history))
        end

        previousValue = item.size

    end
    os.sleep(60)
end