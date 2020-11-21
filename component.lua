Component = {
  Position = {},
  Velocity = {},
}

Component.__index = Component

function Component.Init(lovetoys)
  local self = {
    Position = lovetoys.Component.create("position", {"x","y"}, {x = 0, y = 0}),
    Velocity = lovetoys.Component.create("velocity", {"vx", "vy"}),
  }

  return self
end

return Component
