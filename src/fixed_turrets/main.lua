local component = require("component")
local sides = require("sides")
local sensor = component.openperipheral_sensor
local bridge = component.openperipheral_bridge
local redstoneOutput = component.proxy("5f3ae8ca-a502-478b-8785-b979f8f0ff0a")
local redstoneInput = component.proxy("3b4b8d17-9d2f-4edf-b04d-8d850a2ec551")
local turretsIsOn = false

local targets = {
    "Wither"
}

local turrets = {
    {
        address = "12b5108d-6d74-4272-bc38-70efcfc4a849",
        x = 3,
        y = -4,
        z = 5
    },
    {
        address = "6f0258fa-3571-4228-bbd2-51179ba80c62",
        x = 0,
        y = -4,
        z = 5
    },
    {
        address = "f89251a3-c434-4ba6-88b9-39bb4ae96f56",
        x = -2,
        y = -4,
        z = 5
    },
    {
        address = "3215ebf5-fb9f-4517-875a-1acdd3889714",
        x = -5,
        y = -4,
        z = 5
    }
}

function scanTarget()
    local ids = sensor.getMobIds()
    for i = 1, #ids do
        local status, mob = pcall(sensor.getEntityData, ids[i], "MOB")
        if status and mob then
            local basic = mob.basic()
            for j = 1, #targets do
                if targets[j] == basic.name then
                    return basic
                end
            end
        end
    end
end

function scanTargetPlayer()
    local status, player = pcall(sensor.getPlayerByName, "Sun40")
    if status then
        return player.basic()
    end
end

function turnTurrets(isOn)
    if isOn ~= turretsIsOn then
        for i = 1, #turrets do
            local turret = component.proxy(turrets[i].address)
            if isOn then
                turret.powerOn()
                turret.setArmed(true)
                turretsIsOn = true
            else
                turret.setArmed(false)
                turret.powerOff()
                turretsIsOn = false
            end
        end
    end
end

function attack(targetPosition)
    for i = 1, #turrets do
        local turret = component.proxy(turrets[i].address)
        local x = math.floor(targetPosition.x) + turrets[i].x * -1
        local y = math.floor(targetPosition.y) + turrets[i].y * -1
        local z = math.floor(targetPosition.z) + turrets[i].z * -1

        local yav
        if z >= 0 then
            yav = math.deg(math.atan(x / z)) * -1 + 180
        else
            yav = math.deg(math.atan(x / z)) * -1
        end

        local dist = math.sqrt(x * x + z * z)
        local pitch = math.deg(math.atan(y / dist))

        turret.moveTo(yav, pitch)
        turret.fire()

        bridge.addText(5, (i * 10) + 20, "[" .. i .. "] yav: " .. yav .. " pitch: " .. pitch, 0xFFFFFF)
    end
end

while true do
    if redstoneInput.getInput(sides.west) > 0 then
        local target = scanTarget()
        if target ~= nil then
            turnTurrets(true)
            print("Attack " .. target.name .. " x: " .. target.position.x .. " y: " .. target.position.y .. " z: " .. target.position.z)
            bridge.clear()
            bridge.addText(5, 2, "x: " .. target.position.x, 0xFFFFFF)
            bridge.addText(5, 10, "y: " .. target.position.y, 0xFFFFFF)
            bridge.addText(5, 20, "z: " .. target.position.z, 0xFFFFFF)
            attack(target.position)
            bridge.sync()
        else
            turnTurrets(false)
            print("Nothing found")
            redstoneOutput.setOutput(0, 15)
            os.sleep(0.2)
            redstoneOutput.setOutput(0, 0)
            os.sleep(10)
        end
    end
    os.sleep(0.2)
end