local lovetoys = require("lovetoys/lovetoys")

local state = lovetoys.class("State")

state.renderBelow = false

function state:init() end
function state:update(dt) end
function state:draw() end
function state:shutdown() end
function state:keypressed(key, isrepeat) end
function state:keyreleased(key, isrepeat) end
function state:mousepressed(x, y, key) end

return state