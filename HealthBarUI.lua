local HealthBarUI = {}
HealthBarUI.__index = HealthBarUI

local imgLeft = love.graphics.newImage("res/images/UI/barGreen_horizontalLeft.png")
local imgMid = love.graphics.newImage("res/images/UI/barGreen_horizontalMid.png")
local imgRight = love.graphics.newImage("res/images/UI/barGreen_horizontalRight.png")

setmetatable(HealthBarUI, {
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function HealthBarUI:_init(x, y, hp)
    self.x = x
    self.y = y
    self.hp = hp
end

function HealthBarUI:getX()
    return self.x
end

function HealthBarUI:getY()
    return self.y
end

function HealthBarUI:setX(newval)
    self.x = newval
end

function HealthBarUI:setY(newval)
    self.y = newval
end

function HealthBarUI:getHp(newval)
    return self.hp
end

function HealthBarUI:setHp(newval)
    self.hp = newval
end

function HealthBarUI:draw()
    love.graphics.setColor(255, 255, 255)
    if (self.hp > 0) then
      love.graphics.draw(imgLeft, self.x, self.y)
    end
    local i = 2
    while i < 10 and self.hp >= i do
        love.graphics.draw(imgMid, self.x + imgLeft:getWidth() + (i - 2) * imgMid:getWidth(), self.y)
        i=i+1
    end
    if self.hp == 10 then
        love.graphics.draw(imgRight, self.x + imgLeft:getWidth() + 8 * imgMid:getWidth(), self.y)
    end
end

return HealthBarUI