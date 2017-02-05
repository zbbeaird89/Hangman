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

		private

		def set_cell(value, i)
			@cells[i].value = value
		end

	end
end