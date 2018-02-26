local GameScene = {}

local sakuyaSprite = love.graphics.newImage("res/images/sprites/sakuya.png")
local s = 55
local framesidle = {
    love.graphics.newQuad(9, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(63, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(117, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(171, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(225, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(279, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(333, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(9, 98, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(63, 98, 50, 100, sakuyaSprite:getDimensions()),
}
local framesForward = {
    love.graphics.newQuad(530, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 50, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 100, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 150, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 200, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 250, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 300, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 350, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(530 + 400, 345, 50, 100, sakuyaSprite:getDimensions()),
}
local framesBackward = {
    love.graphics.newQuad(9, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(149, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(199, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(249, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(299, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(299, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(344, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(389, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(434, 345, 45, 100, sakuyaSprite:getDimensions()),
}

local elapsed = 0
local currentFrame = 1

local action = framesidle

function GameScene.draw()
    love.graphics.setBackgroundColor(255, 150, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(sakuyaSprite, action[currentFrame], 200, 200)
    love.graphics.setColor(102, 102, 153)
    love.graphics.rectangle("fill", 0, 300, WIDTH, HEIGHT - 300)
end

function GameScene.update(dt)
    elapsed = elapsed + dt
    if elapsed >= 0.1 then
        elapsed = elapsed - 0.1
        if currentFrame == 6 then
             currentFrame = 1
        else
            currentFrame = currentFrame + 1
        end
    end
end

function GameScene.keypressed(key)
end

function GameScene.keyreleased(key)
    if key == "right" then
        action = framesForward
    elseif key == "left" then
        action = framesBackward
    elseif key == "up" then
        action = framesidle
    end
end

function GameScene.mousepressed(x, y, button)
end

function GameScene.mousereleased(x, y, button)
end

function GameScene.mousemoved(x, y, dx, dy)
end

return GameScene