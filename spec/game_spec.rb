require "spec_helper"

module Hangman
	describe Game do 
		context "#initialize" do 
			it "accepts a 'Word' object" do 
				game = Game.new(Word.new)
				expect(game.word).to be_a Word
			end

			it "returns the word value" do 
				game = Game.new(Word.new)
				expect(game.word.value).to be_a String
			end
		end
	end
end