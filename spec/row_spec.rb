require "spec_helper"

module Hangman
	describe Row do 
		context "#initialize" do 
			it "converts string to array" do 
				word = Word.new
				row = Row.new(word.value)
				expect(row.cells).to be_a Array
			end

			it "contains correct number of dashes and spaces" do 
				word = Word.new
				row = Row.new(word.value)
				expect(row.cells.length).to eq word.value.length 
			end
		end

		context "#update_row" do 
			it "does not raise error" do 
				word = Word.new
				row = Row.new(word.value)
				expect { row.update_row("A", word) }.to_not raise_error
			end
		end
	end
end