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

function SoundBank:addSound(name, filename, static, looping)
    if (static) then
        self.bank[name] = love.audio.newSource(filename, "static")
    else
        self.bank[name] = love.audio.newSource(filename)
    end
    if type(looping) == "boolean" then
        self.bank[name]:setLooping(looping)
    end
end

function SoundBank:getSound(name)
    return self.bank[name]
end

function SoundBank:playSound(name, volume)
    love.audio.play(self.bank[name])
    if type(volume) == "number" then
        self.bank[name]:setVolume(volume)
    end
end

function SoundBank:pauseSound(name)
    love.audio.pause(self.bank[name])
end

function SoundBank:stopSound(name)
    love.audio.stop(self.bank[name])
end

return SoundBank