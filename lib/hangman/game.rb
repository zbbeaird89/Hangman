module Hangman
	class Game
		attr_reader :word
		attr_writer :row
		@@used_letters = []
		@@tries_left = 10

		def initialize(word)
			@word = word
			@row = Row.new(word.value)
		end

		def play
			display_row
		end

		private

		def display_row
			puts ""
			puts ""
			puts @row.cells.join(" ") + "  " + 
			"(Used Letters: #{@@used_letters.join(",")})" + "  " + 
			"(Tries Left: #{@@tries_left})"
		end
	end
end