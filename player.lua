Player = {
  Entity = {}
}

function Player.Init(lovetoys, component)
  local self = {
    Entity = lovetoys.Entity(),
  }
  self.Entity:initialize()

  self.Entity:add(component.Position(150, 25))
  self.Entity:add(component.Velocity(100, 100))

  return self
end

return Player
