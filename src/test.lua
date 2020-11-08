local aspects = {
    asp1 = {
        name = "n1",
        amount = 1
    },
    asp5 = {
        name = "n5",
        amount = 5
    },
    asp9 = {
        name = "n9",
        amount = 9
    },
    asp3 = {
        name = "n3",
        amount = 3
    },
    asp7 = {
        name = "n7"
    }
}

local sortedTable = {}

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

for a, b in pairs(aspects) do
    --print(b.name)
    table.insert(sortedTable, b)
end

table.sort(sortedTable, aspectSort)
for i = 1, #sortedTable do
    print(sortedTable[i].name)
end