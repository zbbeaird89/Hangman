require "spec_helper"

module Hangman
	describe Row do 
		context "#initialize" do 
			it "converts string to array" do 
				word = Word.new
				row = Row.new(word.value)
				expect(row.dashes).to be_a Array
			end

			it "contains correct number of dashes and spaces" do 
				word = Word.new
				row = Row.new(word.value)
				expect(row.dashes.length).to eq word.value.length 
			end
		end
	end
end