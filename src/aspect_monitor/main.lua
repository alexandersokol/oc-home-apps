local component = require("component")
local aspects = require("aspect")
local me = component.me_interface

local GPU_1_ADDRESS = "5ad95739-feab-4396-86b4-4d8a5f8fb6a0"
local GPU_2_ADDRESS = "1c6fc182-6a0d-4481-b22c-d591de6be6c3"

local SCREEN_1_ADDRESS = "a0f44142-f3f9-431a-8514-fe62d63fba54"
local SCREEN_2_ADDRESS = "ce196b8d-8ebd-4dc3-9b71-491817ba1271"

local gpu1 = component.proxy(GPU_1_ADDRESS)
local gpu2 = component.proxy(GPU_2_ADDRESS)
local screen1 = component.proxy(SCREEN_1_ADDRESS)
local screen2 = component.proxy(SCREEN_2_ADDRESS)

print("screen1 bind: " .. tostring(gpu1.bind(screen1.address)))
print("screen2 bind: " .. tostring(gpu2.bind(screen2.address)))

local aspectKeyTable = {}
local aspectTable = {}

local currentGPU = gpu1
local w, h = currentGPU.getResolution()

local x = 1
local y = 1

local width = w / 2
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

    width = w / 2
    height = 3

    paddingX = 2
    paddingY = math.floor(height / 2)

    cursorX = x + paddingX
    cursorY = y + paddingY
    cursorEnd = width - paddingX
end

gpu1.setBackground(0x000000)
gpu1.fill(1, 1, w, h, " ")
gpu2.setBackground(0x000000)
gpu2.fill(1, 1, w, h, " ")

while true do
    updateAspectAmount()
    resetValues()

    currentGPU = gpu1
    local gpuSwitched = false

    for i = 1, #aspectTable do
        local aspect = aspectTable[i]
        currentGPU.setBackground(aspect.background)
        currentGPU.setForeground(aspect.foreground)
        currentGPU.fill(x, y, width, height, " ")
        currentGPU.set(cursorX, cursorY, aspect.label)

        if (aspect.amount) then
            local amountStr = tostring(aspect.amount)
            local length = string.len(amountStr)

            currentGPU.set(cursorEnd - length, cursorY, amountStr)
        end

        y = y + height
        if y + height > h then
            y = 1
            x = x + w / 2
            cursorEnd = w - paddingX
        end

        cursorX = x + paddingX
        cursorY = y + paddingY

        if x > w then
            if gpuSwitched then
                break
            else
                currentGPU = gpu2
                resetValues()
                gpuSwitched = true
            end
        end
    end
    os.sleep(1)
end

gpu1.setBackground(0x000000)
gpu1.setForeground(0xffffff)
gpu1.fill(1, 1, w, h, " ")

gpu2.setBackground(0x000000)
gpu2.setForeground(0xffffff)
gpu2.fill(1, 1, w, h, " ")