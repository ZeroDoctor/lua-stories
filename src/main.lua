local lovetoys = require("lovetoys/lovetoys")
lovetoys.initialize({
  debug = true
})

local stack = require("states/stack")
local gameState = require("states/game_state")
require("event")

function love.load()
	stack:init()
	stack:push(gameState())
end

function love.update(dt)
	stack:peek():update(dt)
end

function love.draw()
  stack:peek():draw()
end

function love.keypressed(key, isrepeat)
  if key == "escape" then -- global exit
    love.event.quit(0)
    return
  end
  stack:peek():keypressed(key, isrepeat)
end

function love.mousepressed(x, y, button)
  stack:peek():mousepressed(x, y, button)
end

