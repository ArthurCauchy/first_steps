local CScreen = require "cscreen"
local SoundBank = require "SoundBank"
local ButtonUI = require "ButtonUI"

local WIDTH = 800
local HEIGHT = 600
local HAND_CURSOR = love.mouse.getSystemCursor("hand")

local exitButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 520,
    "Exit game",
    34)

local musicButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 420,
    "Play music",
    34)

local sb = SoundBank()

function initSounds()
    sb:addSound("bgm", "res/musics/bgm.ogg", false)
    sb:addSound("buttonClick", "res/sounds/button_click.mp3", true)
end

function love.load()
    initSounds()
    CScreen.init(WIDTH, HEIGHT, true)
    love.window.setMode(WIDTH, HEIGHT, {resizable=true})
    love.window.setTitle("A cool window !")
    love.graphics.setBackgroundColor(0, 0, 0)
end

function love.resize(width, height)
    CScreen.update(width, height)
end

function love.draw()
    CScreen.apply()
    exitButton:draw()
    musicButton:draw()
    CScreen.cease()
end

function love.update(dt)
end

function love.keyreleased(key)
    if key == "f" then
        local is_fullscreen = love.window.getFullscreen()
        love.window.setFullscreen(not is_fullscreen)
        if is_fullscreen then
            love.window.setMode(WIDTH, HEIGHT, {resizable=true})
            CScreen.update(WIDTH, HEIGHT)
        end
    end
    if key == "m" then
        love.window.maximize()
    end
end

function love.mousepressed(x, y, button)
    x, y = CScreen.project(x, y)
    if button == 1 and exitButton:isMouseOnIt(x, y) then
        sb:playSound("buttonClick")
        exitButton:setPressed(true)
    elseif button == 1 and musicButton:isMouseOnIt(x, y) then
        sb:playSound("buttonClick")
        musicButton:setPressed(true)
    end
end

function love.mousereleased(x, y, button)
	x, y = CScreen.project(x, y)

    exitButton:setPressed(false)
    musicButton:setPressed(false)
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
    end
end

function love.mousemoved(x, y, dx, dy)
	x, y = CScreen.project(x, y)
    if exitButton:isMouseOnIt(x, y) or musicButton:isMouseOnIt(x, y) then
        love.mouse.setCursor(HAND_CURSOR)
    else
        love.mouse.setCursor()
    end
end
