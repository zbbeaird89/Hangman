require_relative "../lib/hangman.rb"

puts "[Press (1) for New Game, Press (2) to Load Game]"

input = gets.chomp

if input == "1"
	word = Hangman::Word.new
	Hangman::Game.new(word).play
elsif input == "2"
	puts "[Choose a file to load: (1), (2), (3)]"
	num = gets.chomp
	file = File.read("save_files/save#{num}.yml")  
	data = YAML::load(file)
	data.play
end
