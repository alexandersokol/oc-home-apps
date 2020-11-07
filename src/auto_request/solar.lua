local component = require("component")
local me = component.me_controller

while true do

    local list = me.getCraftables({ label = "Solar Panel" })
    if list and #list > 0 then
        local craftable = list[1]
        local request = craftable.request(1000)

        local isCanceled, reason = request.isCanceled()
        local isDone = request.isDone()

        print("Заказал тебе 1000 панелек")

        while not isCanceled and not isDone do
            isCanceled, reason = request.isCanceled()
            isDone = request.isDone()

            if (isDone) then
                print("Закончил крафтить панельки")
            end

            if(isCanceled) then
                print("Не получилось скрафтить панельки " .. reason .. " :(")
            end
        end

        os.sleep(5)
    end


end