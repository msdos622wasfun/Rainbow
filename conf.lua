function love.conf(t)

     t.version = "11.2"
     t.console = false

     t.window.title = "Rainbow Demo"
     t.window.icon = "Icon_png.png"
     t.window.resizable = false
     t.window.fullscreen = true
     t.window.fullscreentype = "desktop"

     t.modules.audio = false
     t.modules.data = false
     t.modules.event = true
     t.modules.font = true
     t.modules.graphics = true
     t.modules.image = true
     t.modules.joystick = false
     t.modules.keyboard = true
     t.modules.math = true
     t.modules.mouse = false
     t.modules.physics = false
     t.modules.sound = false
     t.modules.system = false
     t.modules.thread = false
     t.modules.timer = true
     t.modules.touch = false
     t.modules.video = false
     t.modules.window = true

end
