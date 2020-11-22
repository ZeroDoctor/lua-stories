local lovetoys = require("lovetoys/lovetoys")

local component = {
  Position = lovetoys.Component.create("position", {"x", "y"}, {x = 0, y = 0}),
  Velocity = lovetoys.Component.create("velocity", {"vx", "vy"}),
}

function component.Init()
  print("Components Init...")
end

return component
