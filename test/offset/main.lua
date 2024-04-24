-- Define the table of squares
local squares = {
    {x = 100, y = 200, size = 50},
    {x = 100, y = 200, size = 50},
    {x = 100, y = 200, size = 50},
    -- Add more squares to the table as needed
}

-- Display the squares
function love.draw()
    for i, square in ipairs(squares) do
        -- Calculate the position for each square
        local xOffset = (i - 1) * 10
        local x = square.x + xOffset
        local y = square.y
        local size = square.size

        -- Draw the square
        love.graphics.rectangle("fill", x, y, size, size)
    end
end
