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
	end
end