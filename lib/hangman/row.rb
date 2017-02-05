module Hangman
	class Row
		attr_accessor :dashes
		def initialize(string)
			@dashes = string.split("").map do |letter|
				if letter =~ /\w/
					"_"
				else
					" "
				end
			end
		end
	end
end