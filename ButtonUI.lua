local ClickableUI = require "ClickableUI"

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
    self.width = width
    self.height = height
    self.x = x
    self.y = y
    self.text = text
    self.font = love.graphics.newFont(fontSize)

    self.bgColor = {0, 0, 0}
    self.textColor = {255, 255, 255}
end

function ClickableUI:setText(newval)
    self.text = newval
end

function ButtonUI:draw()
    love.graphics.setColor(self.bgColor)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(self.textColor)
    love.graphics.setFont(self.font)
    love.graphics.print(self.text,
        self.x + self.width/2 - self.font:getWidth(self.text)/2,
        self.y + self.height/2 - self.font:getHeight(self.text)/2)
end

function ButtonUI:isMouseOnIt(x, y)
    return (x > self.x and x < self.x + self.width
        and y > self.y and y < self.y + self.height)
end

function ButtonUI:setBackgroundColor(r, g, b)
    self.bgColor = {r, g, b}
end

function ButtonUI:setTextColor(r, g, b)
    self.textColor = {r, g, b}
end

return ButtonUI