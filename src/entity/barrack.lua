local lovetoys = require("lovetoys/lovetoys")
local ui = require("ui/ui")

local barrack = lovetoys.Entity()

function barrack:init(component)
  self:initialize()
  self.button = ui:createButton(component, "Barrack", self.mouseEvent)
  return self
end

function barrack:mouseEvent(event)
  print("creating barrack?")
end

return barrack
