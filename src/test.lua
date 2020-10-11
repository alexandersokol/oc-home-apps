local aspect = require("aspect/aspect")

-- [] [][][] []
-- []        []
-- []   []   []
-- []        []
-- [] [][][] []


craftable = {
    items = {
        [0] = "", -- Center

        [1] = "",
        [2] = "",
        [3] = "",

        [4] = "",

        [5] = "",
        [6] = "",
        [7] = "",

        [8] = "",

        [9] = "",
        [10] = "",
        [11] = "",

        [12] = "",

        [13] = "",
        [14] = "",
        [15] = "",

        [16] = "",
    }
}

local tier = {}

for key,a in pairs(aspect) do
    if(tier[a.tier] == nil) then
        tier[a.tier] = {}
    end
    table.insert(tier[a.tier], a)
end

for i=1,#tier do
    print("--- TIER " .. i .. " ------------")
    for j=1,#tier[i] do
        local asp = tier[i][j]
        local parents
        if asp.parents ~= nil then
            parents = asp.parents[1].label .. " + " .. asp.parents[2].label
        else
            parents = "nil"
        end
        print(asp.tier, asp.label .. " = " .. parents)
    end
end