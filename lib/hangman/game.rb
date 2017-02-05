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
			while @@tries_left > 0
				display_row
				input = solicit_move
				
			end
		end

		private

		def display_row
			puts ""
			puts "" 
			puts @row.cells.map { |cell| cell.value }.join(" ") + " " + 
			"(Used Letters: #{@@used_letters.join(",")})" + "  " + 
			"(Tries Left: #{@@tries_left})"
		end

		def solicit_move
			puts ""
			puts "[Press (1) to Guess Letter/Word/Phrase, Press (2) to Save Game]"
			puts ""
			#option = gets.chomp
			if gets.chomp == "1"
				puts "What is your guess?"
				return guess
			end
		end

		def guess
			input = gets.chomp.upcase
			if input =~ /\w/ && @word.value.split("").any? { |letter| letter.upcase == input } 
				@row.update_row(input, @word)
				@@used_letters.push(input)
				@@tries_left -= 1
			end
		end

	end
end