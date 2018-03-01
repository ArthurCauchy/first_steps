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
    love.graphics.newQuad(535, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(583, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(631, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(679, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(727, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(776, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(825, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(873, 346, 50, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(921, 346, 50, 100, sakuyaSprite:getDimensions()),
    totalframes = 9
}
local framesBackward = {
    love.graphics.newQuad(9, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(56, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(103, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(149, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(200, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(250, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(297, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(347, 346, 45, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(398, 346, 45, 100, sakuyaSprite:getDimensions()),
    totalframes = 9
}
local framesAttack = {
    love.graphics.newQuad(9, 1084, 55, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(64, 1084, 55, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(119, 1084, 55, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(174, 1084, 65, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(240, 1084, 55, 100, sakuyaSprite:getDimensions()),
    love.graphics.newQuad(295, 1084, 55, 100, sakuyaSprite:getDimensions()),
    totalframes = 6
}

local elapsed = 0
local currentFrame = 1

local action = framesidle

local playerX = 0
local playerY = 200

local interface = Interface()

local level1 = Level()
level1:addGround("ground")

function GameScene.draw()
    level1:draw()
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(sakuyaSprite, action[currentFrame], playerX, playerY)
    --love.graphics.draw(sakuyaSprite, framesBackward[4], 200, 0)
    --love.graphics.draw(sakuyaSprite, framesBackward[5], 200, 100)
    --love.graphics.draw(sakuyaSprite, framesBackward[6], 200, 200)
    --love.graphics.draw(sakuyaSprite, framesBackward[7], 200, 300)
    --love.graphics.draw(sakuyaSprite, framesBackward[8], 200, 400)
    --love.graphics.draw(sakuyaSprite, framesBackward[9], 200, 500)
    interface:draw()
end

function GameScene.update(dt)
    local animationSpeed = 0.1
    elapsed = elapsed + dt
    if action == framesAttack then
        if currentFrame == 4 then
            sb:playSound("swordSlash")
        elseif currentFrame == action.totalframes then
            currentFrame = 1
            action = framesidle
        end
    elseif love.keyboard.isDown("right") then
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
    if key == "d" and action ~= framesAttack then
        currentFrame = 1
        action = framesAttack
    end
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