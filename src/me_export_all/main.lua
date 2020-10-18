local json = require("json") -- https://raw.githubusercontent.com/rxi/json.lua/master/json.lua
local component = require("component")

--local me = component.me_interface
local chest = component.diamond
local internet = component.internet

--local items = me.getItemsInNetwork()
--items.n = nil

local itemsRaw = chest.getAllStacks()
local items = {}

print("allStacks Size: " .. #itemsRaw)

for i=1,#itemsRaw do
    items[i] = itemsRaw[i].basic()
--    items[i] = {
--        name = "A",
--        name = "B",
--    }
end

print("items size: " .. #items)

local itemsJson = json.encode(items)

print(itemsJson)

local handle = internet.request("https://fb3833d4d0edbf03fff6dfec9defcb55.m.pipedream.net", itemsJson)