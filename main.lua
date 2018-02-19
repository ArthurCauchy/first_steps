local CScreen = require "cscreen"
local ButtonUI = require "ButtonUI"

local WIDTH = 800
local HEIGHT = 600

local rect = ButtonUI(300,
    50,
    WIDTH/2 - 300/2, 520,
    "Exit game",
    34)
rect:setBackgroundColor(221, 37, 2)
rect:setTextColor(0, 0, 0)

function love.load()
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
    rect:draw()
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
    if button == 1 and rect:isMouseOnIt(x, y) then
        love.event.quit()
    end
end

function love.mousemoved(x, y, dx, dy)
    if rect:isMouseOnIt(x, y) then
        rect:setBackgroundColor(255, 255, 255)
    end
end