local shell = require("shell")
local filesystem = require("filesystem")

filesystem.remove("/home/aspect.lua")
shell.execute("wget https://raw.githubusercontent.com/alexandersokol/oc-home-apps/master/src/aspect/aspect.lua /home/aspect.lua")

filesystem.remove("/home/crafting_state.lua")
shell.execute("wget https://raw.githubusercontent.com/alexandersokol/oc-home-apps/master/src/thaum_matrix/crafting_state.lua /home/crafting_state.lua")

filesystem.remove("/home/master.lua")
shell.execute("wget https://raw.githubusercontent.com/alexandersokol/oc-home-apps/master/src/thaum_matrix/master.lua /home/master.lua")

filesystem.remove("/home/options.lua")
shell.execute("wget https://raw.githubusercontent.com/alexandersokol/oc-home-apps/master/src/thaum_matrix/options.lua /home/options.lua")

filesystem.remove("/home/recipes.lua")
shell.execute("wget https://raw.githubusercontent.com/alexandersokol/oc-home-apps/master/src/thaum_matrix/recipes.lua /home/recipes.lua")
