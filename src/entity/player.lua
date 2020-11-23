local lovetoys = require("lovetoys/lovetoys")

local player = lovetoys.Entity()

function player:init(component)
  self:initialize()

  self:add(component.Position(150, 25))
  self:add(component.Velocity(0, 0))
  self:add(component.Accel(50, 1.25))
  self:add(component.Color(1.0, 0.0, 0.0, 1.0))
  self:add(component.Size(10, 10))
end

function player:keyEvent(event)
  local velocity = self:get("velocity")
  local accel = self:get("accel").a

  if event.key.s then
    velocity.vy = velocity.vy + accel
  end
  if event.key.w then
    velocity.vy = velocity.vy - accel
  end

  if event.key.d then
	  velocity.vx = velocity.vx + accel
  end
  if event.key.a then
    velocity.vx = velocity.vx - accel
  end
end

function player:mouseEvent(event)
  print("handle mouse", event.x, event.y, event.button)
end

return player
