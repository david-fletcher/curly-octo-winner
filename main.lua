-- globals
local font = nil
local messages = {}
local texts = {
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "Aliquet enim tortor at auctor urna. Magna fringilla urna porttitor rhoncus. Lacus sed turpis tincidunt id aliquet risus feugiat in ante. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Sem et tortor consequat id porta nibh venenatis cras sed. Nam at lectus urna duis convallis convallis. Placerat in egestas erat imperdiet sed euismod. Aenean vel elit scelerisque mauris. Sit amet consectetur adipiscing elit. Varius sit amet mattis vulputate enim nulla aliquet porttitor lacus. Nulla posuere sollicitudin aliquam ultrices sagittis orci a. Amet massa vitae tortor condimentum lacinia. Pretium nibh ipsum consequat nisl vel pretium lectus quam. Malesuada fames ac turpis egestas maecenas pharetra. Id leo in vitae turpis. Pretium aenean pharetra magna ac placerat vestibulum lectus mauris ultrices.",
    "Viverra suspendisse potenti nullam ac tortor vitae. Volutpat odio facilisis mauris sit amet massa.",
    "Purus ut faucibus pulvinar elementum integer enim neque. Nec feugiat in fermentum posuere urna nec tincidunt. Sed elementum tempus egestas sed. Suspendisse ultrices gravida dictum fusce ut. Aliquet porttitor lacus luctus accumsan tortor.",
    "Viverra mauris in aliquam sem. Viverra adipiscing at in tellus integer feugiat scelerisque. Nunc sed id semper risus. Dui accumsan sit amet nulla."
}

-- lifecycle methods
-- called once when the game is loaded
function love.load( arg, unfilteredArg )
    -- default font, but larger
    font = love.graphics.newFont( "fonts/raleway/Raleway-SemiBold.ttf", 16 )

    -- seed the random number generator
    math.randomseed(os.time())
end

-- called every frame to update; dt is time since last update()
function love.update( dt )
    
end

-- called every frame to draw to the screen; love.graphics.clear() is called automatically
function love.draw()
    local prev_msg_y = love.graphics.getHeight() - 100
    for _,msg in pairs(messages) do
        prev_msg_y = prev_msg_y - msg:getHeight() - 10
        love.graphics.draw( msg, 0, prev_msg_y )

        -- stop rendering if it won't be seen anyways
        if( prev_msg_y < 0 ) then
            break
        end
    end
end

-- called when love is about to quit; do cleanup here
function love.quit()

end

-- keyboard inputs
function love.keypressed( key, scancode, isrepeat )
    -- make quitting the game possible
    if( scancode == "delete" ) then
        love.event.quit()
    end

    -- add new paragraph to the screen
    if( scancode == "space" ) then
        local new_str_idx = math.floor( math.random( 5 ) )
        table.insert( messages, 1, message_factory( texts[new_str_idx] ) )
    end
end

-- creates new Text object with given string
function message_factory( str )
    local text = love.graphics.newText( font, nil )
    text:addf( str, love.graphics.getWidth() - 20, "left", 10, 10 )
    return text
end