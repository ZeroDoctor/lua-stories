local lovetoys = require("lovetoys/lovetoys")

local player = lovetoys.Entity()

function player.Init(component)
  player:initialize()

  player:add(component.Position(150, 25))
  player:add(component.Velocity(100, 100))
end

return player
