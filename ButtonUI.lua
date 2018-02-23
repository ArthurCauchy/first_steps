local ClickableUI = require "ClickableUI"

local img = love.graphics.newImage("res/UI/buttonLong_beige.png")
local imgPressed = love.graphics.newImage("res/UI/buttonLong_beige_pressed.png")


local ButtonUI = {}
ButtonUI.__index = ButtonUI

setmetatable(ButtonUI, {
    __index = ClickableUI,
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function ButtonUI:_init(width, height, x, y, text, fontSize)
    ClickableUI._init(self, width, height, x, y)
    
    self.text = text
    self.font = love.graphics.newFont("res/fonts/Gamaliel.otf", fontSize)

    self.image = img
end

function ClickableUI:setText(newval)
    self.text = newval
end

function ButtonUI:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(self.image, self.x, self.y, 0, self.width / self.image:getWidth(), self.height / self.image:getHeight())
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(self.font)
    love.graphics.print(self.text,
        self.x + self.width/2 - self.font:getWidth(self.text)/2,
        self.y + self.height/2 - (self.font:getHeight(self.text)/2) * 1.15)
end

function ButtonUI:isMouseOnIt(x, y)
    return (x > self.x and x < self.x + self.width
        and y > self.y and y < self.y + self.height)
end

function ButtonUI:isPressed(value)
    return (self.image == imgPressed)
end

function ButtonUI:setPressed(value)
    if value then
        self.image = imgPressed
    else
        self.image = img
    end
end

return ButtonUI