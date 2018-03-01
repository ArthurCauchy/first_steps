local Level = {}
Level.__index = Level

setmetatable(Level, {
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function Level:_init()
    love.physics.setMeter(64)
    self.world = love.physics.newWorld()
    self.objects = {}
end

function Level:addGround(name)
    self.objects[name] = {}
    self.objects[name].body = love.physics.newBody(self.world, WIDTH/2, 450)
    self.objects[name].shape = love.physics.newRectangleShape(WIDTH, HEIGHT - 300)
    self.objects[name].fixture = love.physics.newFixture(self.objects[name].body, self.objects[name].shape)
end

function Level:draw()
    love.graphics.setColor(102, 102, 153)
    --love.graphics.rectangle("fill", 0, 300, WIDTH, HEIGHT - 300)
    love.graphics.polygon("fill", self.objects.ground.body:getWorldPoints(self.objects.ground.shape:getPoints()))
end

return Level