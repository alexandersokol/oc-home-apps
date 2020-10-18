local robot = require("robot")
local component = require("component")
local sides = require("sides")
local inventory = component.inventory_controller

while true do
    robot.select(1)
    inventory.equip()

    robot.use(sides.south)
    os.sleep(0.2)
    robot.use(sides.south)
    os.sleep(0.2)
    robot.use(sides.south)
    os.sleep(0.2)
    robot.use(sides.south)
    os.sleep(0.2)
    robot.use(sides.south)
    os.sleep(0.2)

    robot.select(1)
    inventory.equip()

    robot.swing()
    os.sleep(0.2)

    robot.select(2)
    inventory.equip()


    robot.up()
    os.sleep(2)
    robot.forward()
    os.sleep(2)
    robot.useDown()
    os.sleep(2)
    robot.back()
    os.sleep(2)
    robot.down()
    os.sleep(2)

    robot.select(2)
    inventory.equip()


    os.sleep(0.5)
end