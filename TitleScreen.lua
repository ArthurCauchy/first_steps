local TitleScreen = {}

local exitButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 500,
    "Exit game",
    34)
local musicButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 300,
    "Play music",
    34)
local playButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 200,
    "Play",
    34)

function TitleScreen.draw()
    exitButton:draw()
    musicButton:draw()
    playButton:draw()
end

function TitleScreen.update(dt)
end

function TitleScreen.keypressed(key)
end

function TitleScreen.keyreleased(key)
end

function TitleScreen.mousepressed(x, y, button)
    if button == 1 and exitButton:isMouseOnIt(x, y) then
        sb:playSound("buttonClick")
        exitButton:setPressed(true)
    elseif button == 1 and musicButton:isMouseOnIt(x, y) then
        sb:playSound("buttonClick")
        musicButton:setPressed(true)
    elseif button == 1 and playButton:isMouseOnIt(x, y) then
        sb:playSound("buttonClick")
        playButton:setPressed(true)
    end
end

function TitleScreen.mousereleased(x, y, button)
    exitButton:setPressed(false)
    musicButton:setPressed(false)
    playButton:setPressed(false)
    if button == 1 and exitButton:isMouseOnIt(x, y) then
        love.mouse.setCursor()
        love.event.quit()
    elseif button == 1 and musicButton:isMouseOnIt(x, y) then
        if sb:getSound("bgm"):isPlaying() then
            musicButton:setText("Play music")
            sb:pauseSound("bgm")
        else
            musicButton:setText("Pause music")
            sb:playSound("bgm")
        end
    elseif button == 1 and playButton:isMouseOnIt(x, y) then
        sb:stopSound("bgm")
        currentScene = GameScene
    end
end

function TitleScreen.mousemoved(x, y, dx, dy)
    if exitButton:isMouseOnIt(x, y) or musicButton:isMouseOnIt(x, y) or playButton:isMouseOnIt(x, y) then
        love.mouse.setCursor(HAND_CURSOR)
    else
        love.mouse.setCursor()
    end
end

return TitleScreen