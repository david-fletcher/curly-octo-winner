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