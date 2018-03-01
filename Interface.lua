local Interface = {}
Interface.__index = Interface

setmetatable(Interface, {
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function Interface:_init()
    self.hpBar = HealthBarUI(10, 10, 10)
end

function Interface:draw()
    love.graphics.setColor(255, 255, 255)
    self.hpBar:draw()
end

return Interface