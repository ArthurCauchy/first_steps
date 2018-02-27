CScreen = require "cscreen"

WIDTH = 800
HEIGHT = 600
HAND_CURSOR = love.mouse.getSystemCursor("hand")

SoundBank = require "SoundBank"
ButtonUI = require "ButtonUI"
HealthBarUI = require "HealthBarUI"

TitleScreen = require "TitleScreen"
GameScene = require "GameScene"

sb = SoundBank()

currentScene = TitleScreen

function initSounds()
    sb:addSound("bgm", "res/musics/bgm.ogg", false)
    sb:addSound("bgmBattle", "res/musics/Juhani Junkala [Retro Game Music Pack] Level 3.wav", false)
    sb:addSound("buttonClick", "res/sounds/button_click.mp3", true)
    sb:addSound("swordSlash", "res/sounds/sword sound.wav", true)
end

function love.load()
    initSounds()
    CScreen.init(WIDTH, HEIGHT, true)
    love.window.setMode(WIDTH, HEIGHT, {resizable=true})
    love.window.setTitle("A cool window !")
    love.graphics.setBackgroundColor(0, 0, 0)
    love.keyboard.setKeyRepeat(true)
end

function love.resize(width, height)
    CScreen.update(width, height)
end

function love.draw()
    CScreen.apply()
    currentScene.draw()
    CScreen.cease()
end

function love.update(dt)
    currentScene.update(dt)
end

function love.keypressed(key)
    currentScene.keypressed(key)
end

function love.keyreleased(key)
    if key == "f" then
        local is_fullscreen = love.window.getFullscreen()
        love.window.setFullscreen(not is_fullscreen)
        if is_fullscreen then
            love.window.setMode(WIDTH, HEIGHT, {resizable=true})
            CScreen.update(WIDTH, HEIGHT)
        end
    elseif key == "m" then
        love.window.maximize()
    end
    currentScene.keyreleased(key)
end

function love.mousepressed(x, y, button)
    x, y = CScreen.project(x, y)
    currentScene.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	x, y = CScreen.project(x, y)
    currentScene.mousereleased(x, y, button)
end

function love.mousemoved(x, y, dx, dy)
	x, y = CScreen.project(x, y)
    currentScene.mousemoved(x, y, dx, dy)
end
