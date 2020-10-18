local aspect = require("aspect")
local component = require("component")
local options = require("options")
local state = require("crafting_state")

local chest = component.proxy(options.chestAddress)

local currentState = state.IDLE

