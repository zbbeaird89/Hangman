module Hangman
	class Game
		attr_reader :word
		attr_writer :row
		attr_accessor :used_letters, :tries_left

		def initialize(word)
			@word = word
			@row = Row.new(word.value)
			@used_letters = []
			@tries_left = 13
		end

		def play
			loop do 
				display_row
				solicit_move
				@tries_left -= 1
				if game_over? == :winner
					puts "#{@word.value} is the correct answer! You win!"
					break
				elsif game_over? == :loser
					puts "The secret word was #{@word.value}. You lose."
					break
				end		
			end
		end

		private

		def display_row
			puts ""
			puts "" 
			puts @row.cells.map { |cell| cell.value }.join(" ") + " " + 
			"(Used Letters: #{@used_letters.join(",")})" + "  " + 
			"(Tries Left: #{@tries_left})"
		end

		def solicit_move
			puts ""
			puts "[Make a guess or press (1) to Save Game.]"
			puts ""
			input = gets.chomp.upcase
			user_options(input)
		end

		def user_options(input)
			if input == "1"
				save_game
			elsif input =~ /\w/
				track_letters(input) if input.length == 1 #if 1 letter then track it
				manage_input(input)
			else
				puts "That isn't a valid answer."
				solicit_move
			end
		end

		def save_game
			puts "Choose a save file: (1), (2), (3)"
			num = gets.chomp
			File.open("save_files/save#{num}.yml", "w") do |f|
				f.write YAML::dump(self)
			end
		end

		def track_letters(input)
			@used_letters.push(input) unless @used_letters.include?(input)
		end

		#If input is a word then pass to #word_equality
		#If input is 1 letter then check for all instances in word
		#Update row accordingly
		def manage_input(input)
			if input.length > 1
				word_equality(input)
			elsif @word.value.split("").any? { |letter| letter.upcase == input } 
				@row.update_row(input, @word) 
			end
		end

		def word_equality(input)
			if input == @word.value
				@word.value.split("").each_with_index do |letter, i|
					@row.set_cell(letter, i)
				end
			else
				puts "\n\nIncorrect"
			end
		end

		def game_over?
			return :winner if won?
			return :loser if lost?
		end

		def won?
			row_string = @row.cells.map { |cell| cell.value }.join
			return true if row_string == @word.value
			return false
		end

		def lost?
			return true if @tries_left == 0
			return false
		end
	end
end