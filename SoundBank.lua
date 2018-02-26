local SoundBank = {}
SoundBank.__index = SoundBank

setmetatable(SoundBank, {
    __call = function (cls, ...)
        local self = setmetatable({}, cls)
        self:_init(...)
        return self
    end,
})

function SoundBank:_init()
    self.bank = {}
end

function SoundBank:addSound(name, filename, static)
    if (static) then
        self.bank[name] = love.audio.newSource(filename, "static")
    else
        self.bank[name] = love.audio.newSource(filename)
    end
end

function SoundBank:getSound(name)
    return self.bank[name]
end

function SoundBank:playSound(name)
    love.audio.play(self.bank[name])
end

function SoundBank:pauseSound(name)
    love.audio.pause(self.bank[name])
end

function SoundBank:stopSound(name)
    love.audio.stop(self.bank[name])
end

return SoundBank