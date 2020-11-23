local lovetoys = require("lovetoys/lovetoys")

local comp = require("component")
local system = require("system")
local player = require("entity/player")
local barrack = require("entity/barrack")
local state = require("states/state")
require("event")

local gameState = lovetoys.class("GameState", state)

function gameState:init()
  player:init(comp:PlayerComp())
  barrack = barrack:init(comp:ButtonComp())

	self.engine = lovetoys.Engine()
  self.eventmanager = lovetoys.EventManager()
  self.eventmanager:addListener("KeyEvent", player, player.keyEvent)
  self.eventmanager:addListener("PlayerMouseEvent", player, player.mouseEvent)
  self.eventmanager:addListener("BarrackMouseEvent", barrack.button, barrack.button.func)

	self.engine:addSystem(system.MoveSystem())
  self.engine:addSystem(system.DrawSystem())

  self.world = love.physics.newWorld(9.81*80, 0, true)
  self.world:setCallbacks(beginContact, endContact)

  self.engine:addEntity(barrack.button)
  self.engine:addEntity(player)
end

function gameState:update(dt)
  self.engine:update(dt)

  local key = {
	  w = love.keyboard.isDown("w"),
	  a = love.keyboard.isDown("a"),
	  s = love.keyboard.isDown("s"),
	  d = love.keyboard.isDown("d"),
  }

  self.eventmanager:fireEvent(KeyEvent:init(key, true))
end

function gameState:draw()
	self.engine:draw()
end

function gameState:keypressed(key, isrepeat)

end

function gameState:mousepressed(x, y, button)
  self.eventmanager:fireEvent(PlayerMouseEvent:init(x, y, button))
  self.eventmanager:fireEvent(BarrackMouseEvent:init(x, y, button))
end

return gameState
