local lovetoys = require("lovetoys/lovetoys")

local MoveSystem = lovetoys.class("MoveSystem", lovetoys.System)
local DrawSystem = lovetoys.class("DrawSystem", lovetoys.System)

function MoveSystem:MoveSystemInit()
  print("Create Move System...")
end

function MoveSystem:requires()
  return {"position", "velocity"}
end

function MoveSystem:update(dt)
  for _, entity in pairs(self.targets) do
    local position = entity:get("position")
    local velocity = entity:get("velocity")
    position.x = position.x + velocity.vx * dt
    position.y = position.y + velocity.vy * dt
  end
end



function DrawSystem:DrawSystemInit()
  print("Create Draw System...")
end

function DrawSystem:requires()
  return {"position"}
end

function DrawSystem:draw()
  for _, entity in pairs(self.targets) do
    love.graphics.rectangle("fill", entity:get("position").x, entity:get("position").y, 10, 10)
  end
end

system = {
  MoveSystem = MoveSystem, DrawSystem = DrawSystem
}

return system

