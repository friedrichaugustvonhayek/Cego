function game_Field ()
	cardsOnField = {}
	return {
		showCards = function(self) 
			for i = 1, #cardsOnField do
				print(cardsOnField[i]["value"])
			end
		end,
		putCardOnField = function(self, card)
			table.insert(cardsOnField, card)
		end
	}

end

--card = {}
--card[1] = {value = 3, img = "somePath/toSome/File.png"}
--card[2] = {value = 8, img = "somePath/toSome/File.png"}
--GameField = game_Field()
--
--GameField:putCardOnField(card[1])
--GameField:putCardOnField(card[2])
--GameField:showCards()
