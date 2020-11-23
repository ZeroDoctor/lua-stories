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
