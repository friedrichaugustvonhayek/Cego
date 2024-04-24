function externalScope()
	foo = {1,2,3,4}
	shuffleTable(foo)
	for i = 1, 4 do
		print(foo[i])
	end
end
-- Function to shuffle a table
function shuffleTable(tbl)
    local randomIndex, tmp
    for currentIndex = #tbl, 2, -1 do
        -- Pick a random index before the current index
        randomIndex = math.random(currentIndex)
        
        -- Swap the elements at currentIndex and randomIndex
        tmp = tbl[currentIndex]
        tbl[currentIndex] = tbl[randomIndex]
        tbl[randomIndex] = tmp
    end
end

externalScope()
