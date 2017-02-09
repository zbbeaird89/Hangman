module Hangman
	class Row
		attr_accessor :cells
		def initialize(string)
			@cells = string.split("").map do |letter|
				if letter =~ /\w/
					Cell.new("_")
				else
					" "
				end
			end
		end

		def update_row(input, word)
			i = 0
			while i < @cells.length
				if input == word.value[i].upcase
					set_cell(input, i)
				end
				i += 1
			end
		end

		def set_cell(input, i)
			@cells[i].value = input
		end

	end
end