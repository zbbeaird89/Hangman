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
	end
end