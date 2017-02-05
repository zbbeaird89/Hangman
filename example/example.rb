require_relative "../lib/hangman.rb"

word = Hangman::Word.new
Hangman::Game.new(word).play