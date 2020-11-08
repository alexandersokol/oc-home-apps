local component = require("component")
local aspects = require("aspect")
local me = component.me_interface
local gpu = component.gpu

local aspectKeyTable = {}
local aspectTable = {}

local w, h = gpu.getResolution()

local x = 1
local y = 1

local width = math.floor(w / 3)
local height = 3

local paddingX = 2
local paddingY = math.floor(height / 2)

local cursorX = x + paddingX
local cursorY = y + paddingY
local cursorEnd = width - paddingX

print("screenSize:" .. w .. "x" .. h)

for _, b in pairs(aspects) do
    aspectKeyTable[b.name] = b
end

function aspectSort(a, b)
    if not a.amount then
        return false
    elseif not b.amount then
        return true
    elseif a.amount > b.amount then
        return true
    end
    return false
end

function updateAspectAmount()
    local networkAspects = me.getFluidsInNetwork()
    aspectTable = {}
    for i = 1, #networkAspects do
        if networkAspects[i] and networkAspects[i].amount then
            local item = aspectKeyTable[networkAspects[i].name]
            item.amount = math.floor(networkAspects[i].amount / 128)
            table.insert(aspectTable, item)
        end
    end

    table.sort(aspectTable, aspectSort)
end

function resetValues()
    x = 1
    y = 1

    paddingX = 2
    paddingY = math.floor(height / 2)

    cursorX = x + paddingX
    cursorY = y + paddingY
    cursorEnd = width - paddingX
end

gpu.setBackground(0x000000)
gpu.fill(1, 1, w, h, " ")

while true do
    updateAspectAmount()
    resetValues()

    for i = 1, #aspectTable do
        local aspect = aspectTable[i]
        gpu.setBackground(aspect.background)
        gpu.setForeground(aspect.foreground)
        gpu.fill(x, y, width, height, " ")
        gpu.set(cursorX, cursorY, aspect.label)

        if (aspect.amount) then
            local amountStr = tostring(aspect.amount)
            local length = string.len(amountStr)

            gpu.set(cursorEnd - length, cursorY, amountStr)
        end

        y = y + height
        if y + height > h then
            y = 1
            x = x + width
            cursorEnd = x + width - paddingX
        end

        cursorX = x + paddingX
        cursorY = y + paddingY

        if x > w then
            break
        end
    end
    os.sleep(1)
end

gpu.setBackground(0x000000)
gpu.setForeground(0xffffff)
gpu.fill(1, 1, w, h, " ")