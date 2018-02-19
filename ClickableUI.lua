local ClickableUI = {}
ClickableUI.__index = ClickableUI

setmetatable(ClickableUI, {
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function ClickableUI:_init(width, height, x, y)
    self.width = width
    self.height = height
    self.x = x
    self.y = y
end

function ClickableUI:getX()
    return self.x
end

function ClickableUI:getY()
    return self.y
end

function ClickableUI:setX(newval)
    self.x = newval
end

function ClickableUI:setY(newval)
    self.y = newval
end

function ClickableUI:draw()
end

function ClickableUI:isMouseOnIt(x, y)
end

return ClickableUI