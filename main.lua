local player = require("player")
local component = require("component")
local system = require("system")
local handler = require("handler")

local lovetoys = require("lovetoys/lovetoys")
lovetoys.initialize({
  debug = true
})

local engine = {}
local world = {}
local eventmanager = {}

function love.load()
  Component = component.Init(lovetoys)
  Player = player.Init(lovetoys, Component)
  MoveSys = system:MoveSystemInit(lovetoys)
  DrawSys = system:DrawSystemInit(lovetoys)

  engine = lovetoys.Engine()
  engine:addEntity(Player.Entity)
  engine:addSystem(MoveSys.MoveSystem())
  engine:addSystem(DrawSys.DrawSystem())

  print("loading...")
  print(DrawSys.DrawSystem().requires())

  world = love.physics.newWorld(0, 9.81*80, true)
  world:setCallbacks(beginContact, endContact)
  eventmanager = lovetoys.EventManager()
end

function love.update(dt)
  engine:update(dt)
  world:update(dt)
end

function love.draw()
  engine:draw()
end

function love.keypressed(key, isrepeat)
  --eventmanager:fireEvent(handler:KeyPressed(key, isrepeat))
end

function love.mousepressed(x, y, button)
  --eventmanager:fireEvent(handler:MousePressed(x, y, button))
end

