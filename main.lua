local lovetoys = require("lovetoys/lovetoys")
lovetoys.initialize({
  debug = true
})

local player = require("player")
local component = require("component")
local system = require("system")
local handler = require("handler")

local engine = {}
local world = {}
local eventmanager = {}

function love.load()
  component.Init()
  player.Init(component)
  system.MoveSystem:MoveSystemInit()
  system.DrawSystem:DrawSystemInit()


  engine = lovetoys.Engine()
  engine:addEntity(player)
  engine:addSystem(system.MoveSystem())
  engine:addSystem(system.DrawSystem())

  world = love.physics.newWorld(0, 9.81*80, true)
  world:setCallbacks(beginContact, endContact)
  eventmanager = lovetoys.EventManager()
  eventmanager:addListener("KeyEvent", handler, handler.keyEvent)
  eventmanager:addListener("MouseEvent", handler, handler.mouseEvent)
end

function love.update(dt)
  engine:update(dt)
  world:update(dt)
end

function love.draw()
  engine:draw()
end

function love.keypressed(key, isrepeat)
  if key == "escape" then -- global exit
    love.event.quit(0)
    return
  end
  eventmanager:fireEvent(KeyEvent:init(key, isrepeat))
end

function love.mousepressed(x, y, button)
  eventmanager:fireEvent(MouseEvent:init(x, y, button))
end

