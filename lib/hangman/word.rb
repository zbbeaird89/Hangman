module Hangman
	class Word
		attr_reader :value
		def initialize
			_5_to_12_chars = Proc.new { |line| line.length.between?(5, 12) }
			@value = File.open("text/text.txt") do |f|
				f.select(&_5_to_12_chars).sample.sub("\n", "").upcase
			end
		end
	end
end