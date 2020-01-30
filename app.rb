require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/player'
require 'app/cell'
require 'app/game'
require 'app/board'
require 'views/show'
require 'app/string'

def welcome
  puts "Welcome to this morpion game!".green
  puts ""
  puts "What is the name of the first player?".magenta
  name_player_1 = gets.chomp
  puts "Now, what is the name of the second player?".magenta
  name_player_2 = gets.chomp
  puts "Okay let's go now!".green
  puts "" * 3
  return [name_player_1, name_player_2]
end

def perform
  Game.new(welcome)
end
perform