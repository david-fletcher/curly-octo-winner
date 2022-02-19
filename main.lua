local Message   = require 'ui.message'
local Container = require 'ui.container'

-- globals
local font = nil
local messageContainer = nil
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

    -- create initial container
    messageContainer = Container:createNew( 100, 10, 600, 500 )
end

-- called every frame to update; dt is time since last update()
function love.update( dt )
    
end

-- called every frame to draw to the screen; love.graphics.clear() is called automatically
function love.draw()
    messageContainer:draw()
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
        messageContainer:appendChild( Message:createNew( messageContainer, font, texts[new_str_idx] ) )
    end
end