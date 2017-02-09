module Hangman
	class Game
		def to_json(*a)
			{
				"json_class" => self.class.name,
				"data" => {
					"word" => @word,
					"row" => @row,
				}
			}.to_json(*a)
		end

		def self.json_create(o)
			new(o["data"]["word"], o["data"]["row"])
		end
	end
end