require "spec_helper"

module Hangman
	describe Cell do 
		context "#initialize" do 
			it "excepts 'a' as a value" do 
				expect { Cell.new('a') }.to_not raise_error
			end

			it "returns \"\" when no value is given" do 
				cell = Cell.new
				expect(cell.value).to eq ""
			end

			it "value can be updated" do 
				cell = Cell.new
				cell.value = "a"
				expect(cell.value).to eq "a"
			end
		end
	end
end