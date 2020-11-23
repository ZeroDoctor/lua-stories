local lovetoys = require("lovetoys/lovetoys")
local ui = require("ui/ui")

local barrack = lovetoys.Entity()

local function fireEvent()
  print("creating barrack?")
end

function barrack:init(component)
  self:initialize()
  self.button = ui:createButton(component, "Barrack", fireEvent)
end

return barrack
