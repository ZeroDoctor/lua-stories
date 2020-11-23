local lovetoys = require("lovetoys/lovetoys")

local MoveSystem = lovetoys.class("MoveSystem", lovetoys.System)
local DrawSystem = lovetoys.class("DrawSystem", lovetoys.System)

function MoveSystem:requires()
  return {"position", "velocity", "accel"}
end

function MoveSystem:update(dt)
  for _, entity in pairs(self.targets) do
    local position = entity:get("position")
	  local velocity = entity:get("velocity")
	  local accel = entity:get("accel")
    position.x = position.x + velocity.vx * dt
	  position.y = position.y + velocity.vy * dt

    if velocity.vx ~= 0 then
      velocity.vx = math.floor(velocity.vx / accel.da)
    end

    if velocity.vy ~= 0 then
      velocity.vy = math.floor(velocity.vy / accel.da)
    end
  end
end

function DrawSystem:requires()
  return {"position", "size", "color"}
end

function DrawSystem:draw()
  for _, entity in pairs(self.targets) do
	local color = entity:get("color")
	local position = entity:get("position")
	local size = entity:get("size")

	love.graphics.setColor(color.r, color.g, color.b, color.a)
    love.graphics.rectangle("fill", position.x, position.y, size.w, size.h)
  end
end

local system = {
  MoveSystem = MoveSystem,
  DrawSystem = DrawSystem,
}

return system

