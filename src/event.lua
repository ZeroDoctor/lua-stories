KeyEvent = {}
KeyEvent.class = {name = "KeyEvent"}

function KeyEvent:init(key, isrepeat)
    self.key = key
    self.isrepeat = isrepeat
    return self
end

PlayerMouseEvent = {}
PlayerMouseEvent.class = {name = "PlayerMouseEvent"}

function PlayerMouseEvent:init(x, y, button)
    self.x = x
    self.y = y
    self.button = button
    return self
end

BarrackMouseEvent = {}
BarrackMouseEvent.class = {name = "BarrackMouseEvent"}

function BarrackMouseEvent:init(x, y, button)
    self.x = x
    self.y = y
    self.button = button
    return self
end
