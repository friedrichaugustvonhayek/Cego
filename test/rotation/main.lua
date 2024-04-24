local centerX = 400
local centerY = 500
local angle = math.rad(30)

function love.draw()
    love.graphics.translate(centerX, centerY)
    love.graphics.rotate(angle)
    love.graphics.rectangle("fill", 0, 100, 200, 100) -- Draw a rectangle before rotation
    love.graphics.rotate(angle)
    love.graphics.rectangle("fill", 0, 100, 200, 100) -- Draw a rectangle before rotation
    love.graphics.rotate(angle)
    love.graphics.rectangle("fill", 0, 100, 200, 100) -- Draw a rectangle before rotation
    love.graphics.rotate(angle)
    love.graphics.rectangle("fill", 0, 100, 200, 100) -- Draw a rectangle before rotation
    love.graphics.translate(-centerX, -centerY)
    --love.graphics.rotate(math.rad(30)) -- Rotate the graphics context by 30 degrees
    --love.graphics.rectangle("fill", 100, 100, 200, 100) -- Draw a rectangle after rotation
end
