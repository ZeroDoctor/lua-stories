local lovetoys = require("lovetoys/lovetoys")

local ui = {}

function ui:createButton(component, display, func)
  local button = lovetoys.Entity()
  button:initialize()

  button:add(component.Position(725, 250))
  button:add(component.Color(0.0, 0.0, 1.0, 1.0))
  button:add(component.Button(func, display))
  button:add(component.Size(50, 50))
	return button
end


return ui