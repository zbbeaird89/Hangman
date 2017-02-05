require "spec_helper"

module Hangman
	describe Word do 
		context "#initialize" do 
			it "selects a word" do 
				word = Word.new
				expect(word.value).to be_a String
			end

			it "word is 5-12 characters long" do 
				word = Word.new
				expect(word.value.length).to be_between(5, 12)
			end
		end
	end
end