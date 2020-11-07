local component = require("component")
local aspect = require("aspect")
local colors = require("colors")

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

local RR = {
    "00",
    "33",
    "66",
    "99",
    "CC",
    "FF"
}

local GG = {
    "00",
    "24",
    "49",
    "6D",
    "92",
    "B6",
    "DB",
    "FF"
}

local BB = {
    "00",
    "40",
    "80",
    "C0",
    "FF"
}

for r=1, #RR do
    for g=1, #GG do
        for b=1, #BB do
            local color = "0x" .. RR[r] .. GG[g] .. BB[b]

        end
    end
end

local w, h = gpu2.getResolution()
gpu2.fill(1, 1, w, h, " ")
gpu2.setForeground(0xFFFF00)
gpu2.fill(1, 1, w, h/2, "█")
gpu2.setForeground(0x808080)
gpu2.fill(1, h/2, w, h, "█")

