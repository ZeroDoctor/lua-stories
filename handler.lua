local lovetoys = require("lovetoys/lovetoys")

KeyEvent = {}
KeyEvent.class = {name = "KeyEvent"}

function KeyEvent:init(key, isrepeat)
    self.key = key
    self.isrepeat = isrepeat
    return self
end

MouseEvent = {}
MouseEvent.class = {name = "MouseEvent"}

function MouseEvent:init(x, y, button)
    self.x = x
    self.y = y
    self.button = button
    return self    
end

local handler = lovetoys.class("Handler")
handler.class = {name = "Handler"}

function handler:keyEvent(event)
    print("handle key", event.key)
end

function handler:mouseEvent(event)
    print("handle mouse", event.x, event.y, event.button)
end

return handler
