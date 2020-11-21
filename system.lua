local MoveSystem = {}
MoveSystem.__index = MoveSystem

local DrawSystem = {}
DrawSystem.__index = DrawSystem

local System = {
  MoveSystem = MoveSystem, DrawSystem = DrawSystem
}

print("System")

function MoveSystem:MoveSystemInit(lovetoys)
  local self = { MoveSystem = lovetoys.class("MoveSystem", lovetoys.System), }
  setmetatable(self, MoveSystem)
  return self
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

function DrawSystem:DrawSystemInit(lovetoys)
  local self = { DrawSystem = lovetoys.class("DrawSystem", lovetoys.System), }
  setmetatable(self, DrawSystem)
  return self
end

function DrawSystem:requires()
  print("sup")

  return {"position"}
end

function DrawSystem:draw()
  print("hello")
  for _, entity in pairs(self.targets) do
    love.graphics.rectangle("fill", entity:get("position").x, entity:get("position").y, 10, 10)
  end
end

return System

