local config = require("config")


function love.load()
	----------------- game settings  -----------------------------------------------------
    	love.window.setMode(config.windowWidth, config.windowHeight, config.windowFlags)    --
	--------------------------------------------------------------------------------------
	----------------- image printing -----------------
	initRotationHand = math.rad(-45)
	rotationHandNeighborDifference = math.rad(30)
	xScreenMiddle = love.graphics.getWidth() / 2	--
	screenWidth = love.graphics.getWidth() 
	yButton = love.graphics.getHeight()		--
	images = {}					--
	images = loadImages()				--
	imageXcenter = images[1]:getWidth() / 2		--
	imageYbutton = images[1]:getHeight()		--
	imageWidth = images[1]:getWidth() 		--
	imageHeight = images[1]:getHeight()		--
	handPosX = getXhandCards(25)			--
                                                        --
	--------------------------------------------------
	-------------------- game objects ----------------
	deck = getDeck(22)				--
        board = game_Field()                            --
	players = {}                                    --
        patrick = Spieler()                             --
	table.insert(players, patrick)                  --
                                                        --
	--------------------------------------------------
	testCard = loadCard(2)
	--board:putCardOnField(testCard)
	--board:putCardOnField(testCard)
	--board:putCardOnField(testCard)
	--board:putCardOnField(testCard)
	--board:putCardOnField(testCard)
	--board:showCards()
	--print(board:getNumberOfCardsOnBoard())
	positions = getFieldCardPositions()
	
end
ct = 0
tnc = 1
function love.update(dt)
    ct = ct + dt
    if ct > tnc and tnc < 8 then
        --board:putCardOnField(testCard)
        tnc = tnc + 1
    end

end

function love.draw()

	patrick:displayHand()
	board:displayField()
	
end

function shuffleTable(tbl)
    local randomIndex, tmp
    for currentIndex = #tbl, 2, -1 do
        randomIndex = math.random(currentIndex)
        tmp = tbl[currentIndex]
        tbl[currentIndex] = tbl[randomIndex]
        tbl[randomIndex] = tmp
    end
end

function loadCard(value)
	function getFileName(value)
		if (value<10) then 
			path = "img/karten/0"..value..".png"
		else
			path = "img/karten/"..value..".png"
		end
		return path
	end
	imgFile = getFileName(value)
	img = love.graphics.newImage(imgFile)
	return {
		value = value,
		img = img
	}
end

function getDeck(amount)
	cards = {}
	--check if all files are there
	for i = 1, amount do
		newCard = loadCard(i)
		table.insert(cards, newCard)
	end
	shuffleTable(cards)
	return {
		cards = cards,
		pop = function(self) 
			table.remove(self.cards, #self.cards)
			return self.cards[#cards]
		end
	}
end

function Spieler()
	karten = {}
	return {
		zeigeKarten = function(self)
			print("alle Spieler sehen deine Karten(2implemend)")
			print(#karten)
			for i = 1, #karten do
				print("Wert: "..karten[i].value)
			end
		end,
		zieheKarte = function(self)
			newCard = deck:pop()
			table.insert(karten, newCard)
		end,
		werfeKarteWeg = function(self, pos)
			table.remove(karten, pos)
		end,
		legeKarte = function(self, pos)
			board:putCardOnField(karten[pos])
			table.remove(karten, pos)
		end,
		displayHand = function(self)
			local rotationHand = initRotationHand
			for i = 1, #karten do
				love.graphics.draw(karten[i].img  , handPosX[i], yButton, rotationHand, 1, 1, imageXcenter, imageYbutton)
				rotationHand = rotationHand + rotationHandNeighborDifference
			end
		end
	}

end

function point(x, y)
	return {
		x = x,
		y = y
	}
end

function getFieldCardPositions()
	imageNeighbourSpacing = 25
	numberOfCardsOnBoard = board:getNumberOfCardsOnBoard()
	imageElementWidth = imageNeighbourSpacing + imageWidth
	boxWidth = imageElementWidth * numberOfCardsOnBoard
	startPosX = (screenWidth - boxWidth) / 2
	middleTopY = (love.graphics.getHeight() / 2) - (love.graphics.getHeight() / 4)
	positions = {}
	for i = 1, numberOfCardsOnBoard do
		xPos = (i-1) * imageElementWidth + startPosX
		positions[i] = point(xPos, middleTopY)
	end
	return positions
end

function game_Field()
	local cardsOnField = {}
	local cardPositionsOnField = {}
	return {
		getNumberOfCardsOnBoard = function(self)
			return #cardsOnField
		end,
		showCards = function(self) 
			for i = 1, #cardsOnField do
				print(cardsOnField[i]["value"])
			end
		end,
		putCardOnField = function(self, card)
			table.insert(cardsOnField, card)
			cardPositionsOnField = getFieldCardPositions()
		end,
		displayField = function(self)
			if not (0 == #cardsOnField) then
				for i = 1, #cardsOnField do
					love.graphics.draw(cardsOnField[i].img, cardPositionsOnField[i].x, cardPositionsOnField[i].y)
				end
			end
		end
	}
end

function loadImages()
	for i = 1, 22 do
		if (i<10) then
			images[i] = love.graphics.newImage("img/karten/0"..i..".png")
		else
			images[i] = love.graphics.newImage("img/karten/"..i..".png")
		end
	end
	return images
end

function getXhandCards(distance)
	-- fills an table of 4 elements and returns it
	local xPos = {}
	xPos[1] = -1 * (distance /2 + distance) + xScreenMiddle
	for i = 2, 4 do
		xPos[i] = xPos[i-1] + distance
	end
	return xPos
end

function love.keypressed(key)
   if key == "escape" then
	love.event.quit()
   elseif key == "1" then
	   patrick:legeKarte(1)
   elseif key == "2" then
	   patrick:legeKarte(2)
   elseif key == "3" then
	   patrick:legeKarte(3)
   elseif key == "4" then
	   patrick:legeKarte(4)
   elseif key == "space" then
	   patrick:zieheKarte()
   end
end

--deck = getDeck(22)
--print("patrick zieht eine karte")
--patrick:zieheKarte()
--print("patrick zieht eine karte")
--patrick:zieheKarte()
--print("patrick zeigt seine karten")
--patrick:zeigeKarten()
--print("patrick wirft seine letzte karte weg")
--patrick:werfeKarteWeg()
--print("patrick zeigt seine karten")
--patrick:zeigeKarten()
--
--deckCards = getDeck(22)
--print("amount of cards in the deck: "..#deckCards.cards)
--drawnCard = deckCards:pop()
--print("imgage: "..drawnCard.img)
--print("amount of cards in the deck: "..#deckCards.cards)
--drawnCard = deckCards:pop()
--print("imgage: "..drawnCard.img)


