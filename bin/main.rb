#!/usr/bin/env ruby
class TicGame
  def initialize
    @board = Board.new
    @board.show
    puts 'Welcome to Ruby\'s Tic Tac Toe!'
    player1 = Player.new(name('X'))
    player2 = Player.new(name('O'))
    puts "#{player1.name} will play with X and #{player2.name} will play with O"
    @game = Game.new(player1, player2)
    game_round
  end

  def name(token)
    case token
    when 'X'
      puts 'First player, please enter your name:'
    when 'O'
      puts 'Second player, please enter your name:'
    end
    name = gets.chomp
    name(token) if name.empty?
    name
  end

  def game_round
    loop do
      @board = Board.new
      @board.show
      @game.assign_current_player
      @game.turn
      @game.count
      select_position
      if @game.winner
        @game.game_over(@game.winner)
        @board.show
        exit
      elsif @game.count == 9
        @game.game_over(nil)
        @board.show
        exit
      end
    end
    reset
  end

  def select_position
    position = gets.chomp.to_i - 1
    if @game.valid_move?(position)
      @game.move(position)
    else
      puts 'Invalid move, please enter a valid position'
      select_position
    end
  end
end

TicGame.new
