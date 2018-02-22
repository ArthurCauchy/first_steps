local CScreen = require "cscreen"
local ButtonUI = require "ButtonUI"

local WIDTH = 800
local HEIGHT = 600

--titleMusic = love.audio.newSource("RPG-Misty_Mountains.ogg")
--musicPlaying = false

local exitButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 520,
    "Exit game",
    34)
exitButton:setBackgroundColor(221, 37, 2)
exitButton:setTextColor(0, 0, 0)

local musicButton = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 420,
    "Play music",
    34)
musicButton:setBackgroundColor(0, 0, 255)
musicButton:setTextColor(0, 0, 0)

function love.load()
    titleMusic = love.audio.newSource("bgm.ogg")

    love.window.setMode(WIDTH, HEIGHT, {resizable=true})
    CScreen.init(WIDTH, HEIGHT, true)
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

function love.mousereleased(x, y, button)
	x, y = CScreen.project(x, y)
    if button == 1 and exitButton:isMouseOnIt(x, y) then
        love.event.quit()
    elseif button == 1 and musicButton:isMouseOnIt(x, y) then
        if titleMusic:isPlaying() then
            musicButton:setText("Play music")
            love.audio.pause(titleMusic)
        else
            musicButton:setText("Pause music")
            love.audio.play(titleMusic)
        end
    end
end

function love.mousemoved(x, y, dx, dy)
	x, y = CScreen.project(x, y)
    if exitButton:isMouseOnIt(x, y) then
        exitButton:setBackgroundColor(255, 255, 255)
    end
end
