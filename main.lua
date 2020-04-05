--[[

     Rainbow (a graphics demo)
     Version 2.01
     Copyleft 2020 by Erich Kohl

--]]

function love.load()

     MODE_TITLE = 0
     MODE_DEMO_IN_PROGRESS = 1

     screenWidth = 0
     screenHeight = 0
     currentMode = 0
     demoSpeed = 0
     orientationTimer = 0
     orientation = 0
     timer = 0

     love.math.setRandomSeed(love.timer.getTime())

     screenWidth = love.graphics.getWidth()
     screenHeight = love.graphics.getHeight()

     largeFont20 = love.graphics.newFont(20)

     paletteRed = {}
     paletteGreen = {}
     paletteBlue = {}

     canvas = love.graphics.newCanvas(screenWidth, screenHeight)

     new_rainbow()

     currentMode = MODE_TITLE

end

function love.update(dt)

     timer = timer + dt
     if demoSpeed == 1 then
          if timer >= 2 then
               new_rainbow()
               timer = 0
          end
     elseif demoSpeed == 2 then
          if timer >= 1.25 then
               new_rainbow()
               timer = 0
          end
     elseif demoSpeed == 3 then
          if timer >= .5 then
               new_rainbow()
               timer = 0
          end
     end

end

function love.draw()

     -- The screen is automatically cleared first

     if currentMode == MODE_TITLE then
          love.graphics.setColor(1, 1, 1, 1)
          love.graphics.setFont(largeFont20)
          love.graphics.printf("Rainbow v2.01 -- A Graphics Demo", 0, (screenHeight / 2) - 100, screenWidth, "center")
          love.graphics.printf("Copyleft 2020 by Erich Kohl", 0, (screenHeight / 2) - 75, screenWidth, "center")
          love.graphics.setColor(1, 0, 0, 1)
          love.graphics.line(0, (screenHeight / 2), screenWidth, (screenHeight / 2))
          love.graphics.setColor(0, 1, 0, 1)
          love.graphics.line(0, (screenHeight / 2) + 5, screenWidth, (screenHeight / 2) + 5)
          love.graphics.setColor(0, 0, 1, 1)
          love.graphics.line(0, (screenHeight / 2) + 10, screenWidth, (screenHeight / 2) + 10)
          love.graphics.setColor(1, 1, 1, 1)
          love.graphics.printf("To start the demo, press a number from 1 - 3 to select a speed.", 0, (screenHeight / 2) + 35, screenWidth, "center")
          love.graphics.printf("1. Slower", 0, (screenHeight / 2) + 85, screenWidth, "center")
          love.graphics.printf("2. Normal", 0, (screenHeight / 2) + 110, screenWidth, "center")
          love.graphics.printf("3. Faster", 0, (screenHeight / 2) + 135, screenWidth, "center")
          love.graphics.printf("Press Esc during the demo to return to the main menu.", 0, (screenHeight / 2) + 185, screenWidth, "center")
          love.graphics.printf("Press Esc to exit the program.", 0, screenHeight - 50, screenWidth, "center")
     elseif currentMode == MODE_DEMO_IN_PROGRESS then
          love.graphics.draw(canvas, 0, 0)
     end

end

function love.keyreleased(key)

     if currentMode == MODE_TITLE then
          if key == "escape" then
               love.event.quit()
          end
          if key == "1" or key == "2" or key == "3" then
               demoSpeed = tonumber(key)
               currentMode = MODE_DEMO_IN_PROGRESS
          end
     elseif currentMode == MODE_DEMO_IN_PROGRESS then
          if key == "escape" then
               currentMode = MODE_TITLE
          end
     end

end

function new_rainbow()

     local x = 0
     local y = 0
     local a = 0
     local f = 0
     local palIndex = 0

     if orientationTimer == 0 then
          orientation = love.math.random(1, 4)
          orientationTimer = love.math.random(3, 10)
     end

     f = (screenWidth * screenHeight) / 16

     for a = 1, 17, 1 do
          paletteRed[a] = love.math.random()
          paletteGreen[a] = love.math.random()
          paletteBlue[a] = love.math.random()
     end

     love.graphics.setCanvas(canvas)

     for x = 0, screenWidth, 1 do
          for y = 0, screenHeight, 1 do
               if orientation == 1 then
                    palIndex = math.floor((x * y) / f) + 1
               elseif orientation == 2 then
                    palIndex = math.floor(((screenWidth - x) * (screenHeight - y)) / f) + 1
               elseif orientation == 3 then
                    palIndex = math.floor((x * (screenHeight - y)) / f) + 1
               else
                    palIndex = math.floor(((screenWidth - x) * y) / f) + 1
               end
               love.graphics.setColor(paletteRed[palIndex], paletteGreen[palIndex], paletteBlue[palIndex], 1)
               love.graphics.points(x, y)
          end
     end

     love.graphics.setCanvas()

     orientationTimer = orientationTimer - 1

end
