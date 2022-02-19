-- configure love
function love.conf( t )
    -- TODO: change settings before release!
    -- https://loveref.github.io/#love.conf
    -- game identity
    t.identity = "curly-octo-winner"
    t.window.title = "Curly Octo Winner"
    -- t.window.icon = "./assets/some-icon.png"

    -- window settings
    t.window.width = 800
    t.window.height = 600
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 400
    t.window.minheight = 300
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop" -- / "normal"
    t.window.vsync = true -- / 1

    -- disable unnecessary packages
    t.accelerometerjoystick = false
    t.modules.joystick = false
    t.modules.physics = false
    t.modules.touch = false
    t.modules.video = false
    t.modules.thread = false
end

-- globals
local font = nil
local text = nil

-- lifecycle methods
-- called once when the game is loaded
function love.load( arg, unfilteredArg )
    -- default font, but larger
    font = love.graphics.newFont( 24, "normal", love.graphics.getDPIScale() )
    text = love.graphics.newText( font, nil )
end

-- called every frame to update; dt is time since last update()
function love.update( dt )
    text:clear()

    local str = "Hello there, this is quite a long string to test the word wrapping in LOVE, not sure if this will work but golly gee it's worth a shot! The API seems mighty powerful which is great news to me!"
    local text_idx = text:addf( str, love.graphics.getWidth() - 20, "left", 10, 10 )
end

-- called every frame to draw to the screen; love.graphics.clear() is called automatically
function love.draw()
    love.graphics.draw( text )
end

-- called when love is about to quit; do cleanup here
function love.quit()

end

-- keyboard inputs
function love.keypressed( key, scancode, isrepeat )
    -- make quitting the game possible
    if ( scancode == "delete" ) then
        love.event.quit()
    end
end