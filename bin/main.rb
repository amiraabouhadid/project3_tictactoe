#!/usr/bin/env ruby
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Board
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end
end

class Game
  attr_reader :current_player

  def initialize
    puts 'Welcome to Ruby\'s Tic Tac Toe'
    @board = Board.new
    @player1 = player1
    @player2 = player2
    player1 = Player.new(name('X'))
    player2 = Player.new(name('O'))
    @game = Game.new(player1, player2)
    game_round
  end
end

def name(player)
  puts 'Enter player name :'
  name = gets.chomp
  name(player) if name.empty?
  name
end

def game_round
  loop do
    puts "It's #{@game.current_player}'s turn!'"
    puts @game.turn
    puts @game.board
    player_input
    if @game.end?
      puts @game.game_over(@game.end)
    else
      puts @game.game_over(nil)
    end
    puts @game.board
  end
end

def player_input
  puts "#{@game.current_player.name}, select a position 1-9:"
  position = gets.chomp.to_i - 1
  if @game.valid_move?(position)
    @game.move(position)
  else
    puts 'Invalid move, please enter a valid position.'
    player_input
  end
end

Game.new
