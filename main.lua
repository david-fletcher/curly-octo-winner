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