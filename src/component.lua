local lovetoys = require("lovetoys/lovetoys")

local component = {
  Position = lovetoys.Component.create("position", {"x", "y"}, {x = 0, y = 0}),
  Velocity = lovetoys.Component.create("velocity", {"vx", "vy"}),
  Accel = lovetoys.Component.create("accel", {"a", "da"}),
  Color = lovetoys.Component.create("color", {"r", "g", "b", "a"}, {r = 0.0, g = 0.0, b = 0.0, a = 1.0}),
  Size = lovetoys.Component.create("size", {"w", "h"}, {w = 50, h = 50}),

  Button = lovetoys.Component.create("button", {"display", "func"}, {display = "N/A", func = function() end}),
}

function component:PlayerComp()
  local playerComp = {
	  Position = self.Position,
	  Velocity = self.Velocity,
	  Accel = self.Accel,
	  Color = self.Color,
	  Size = self.Size,
  }
  return playerComp
end

function component:ButtonComp()
	local buttonComp = {
		Position = self.Position,
		Color = self.Color,
		Button = self.Button,
		Size = self.Size,
	}
	return buttonComp
end


return component
