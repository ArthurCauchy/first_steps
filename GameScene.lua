local GameScene = {}

local sakuyaSprite = love.graphics.newImage("res/images/sprites/sakuya.png")
local framesidle = {
    love.graphics.newQuad(9, 100, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(64, 100, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(118, 100, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(172, 100, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(226, 100, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(277, 100, 50, 100, sakuyaSprite:getDimensions()),
    totalframes = 6
}
local framesForward = {
    love.graphics.newQuad(535, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(583, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(631, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(679, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(727, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(776, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(825, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(873, 345, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(921, 345, 50, 100, sakuyaSprite:getDimensions()),
    totalframes = 9
}
local framesBackward = {
    love.graphics.newQuad(9, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(56, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(103, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(149, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(200, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(250, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(297, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(347, 345, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(398, 345, 45, 100, sakuyaSprite:getDimensions()),
    totalframes = 9
}

local elapsed = 0
local currentFrame = 1

local action = framesidle

local playerX = 0
local playerY = 200

function GameScene.draw()
    love.graphics.setColor(255, 255, 255)
    --love.graphics.rectangle("fill", 400, 200, 45, 100)
    love.graphics.draw(sakuyaSprite, action[currentFrame], playerX, playerY)
    --love.graphics.draw(sakuyaSprite, framesBackward[4], 200, 0)
    --love.graphics.draw(sakuyaSprite, framesBackward[5], 200, 100)
    --love.graphics.draw(sakuyaSprite, framesBackward[6], 200, 200)
    --love.graphics.draw(sakuyaSprite, framesBackward[7], 200, 300)
    --love.graphics.draw(sakuyaSprite, framesBackward[8], 200, 400)
    --love.graphics.draw(sakuyaSprite, framesBackward[9], 200, 500)
    love.graphics.setColor(102, 102, 153)
    --love.graphics.rectangle("fill", 0, 0, 200, HEIGHT)
    love.graphics.rectangle("fill", 0, 300, WIDTH, HEIGHT - 300)
end

function GameScene.update(dt)
    local animationSpeed = 0.1
    elapsed = elapsed + dt
    if love.keyboard.isDown("right") then
        playerX = playerX + 2
        if action ~= framesForward then
            currentFrame = 1
            action = framesForward
        end
    elseif love.keyboard.isDown("left") then
        playerX = playerX - 1
        if action ~= framesBackward then
            currentFrame = 1
            action = framesBackward
        end
    else
        if action ~= framesidle then
            currentFrame = 1
            action = framesidle
        end
    end
    if elapsed >= animationSpeed then
        elapsed = elapsed - animationSpeed
        if currentFrame == action.totalframes then
             currentFrame = 1
        else
            currentFrame = currentFrame + 1
        end
    end
end

function GameScene.keypressed(key)
    --[[lastKeyPress = 0
    if key == "right" then
        elapsed = 0
        currentFrame = 1
        action = framesForward
    elseif key == "left" then
        elapsed = 0
        currentFrame = 1
        action = framesBackward
    elseif key == "up" then
        elapsed = 0
        currentFrame = 1
        action = framesidle
    end--]]
end

function GameScene.keyreleased(key)
    
end

function GameScene.mousepressed(x, y, button)
end

function GameScene.mousereleased(x, y, button)
end

function GameScene.mousemoved(x, y, dx, dy)
end

return GameScene