local lovetoys = require("lovetoys/lovetoys")

local stack = lovetoys.class("Stack")

function stack:init()
	self.states = {}
	self.backCounter = 0
end

function stack:peek()
  if #self.states == 0 then
    return nil
  elseif #self.states > 0 then
    return self.states[#self.states]
  end
end

function stack:push(element)
  table.insert(self.states, element)
  self:peek():init()
end

function stack:pop()
  if self:peek() then
    table.remove(self.states, #self.states)
  end
end

function stack:popInit()
  self:pop()
  self:peek():init()
end

function stack:draw()
    for i = 0, #self.states-1 , 1 do
        if self.states[#self.states-i].renderBelow == false then
            break
        elseif self.states[#self.states-i].renderBelow == true then
            self.backCounter = i
        end
    end
    for i = self.backCounter, 0 , -1 do
        self.states[#self.states-i]:draw()
    end
end

function stack:update(dt)
    if self:peek() then self:peek():update(dt) end
end

return stack
