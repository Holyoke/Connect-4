require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @players = {
      white: HumanPlayer.new(:w),
      black: HumanPlayer.new(:b)
    }
    @current_player = :white
  end

  def play
    42.times do |x|
      @players[@current_player].play_turn(@board)
      @current_player = (x % 2 == 0) ? :black : :white
    end
  end
end

class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play_turn(board)
    begin
      board.fill_column(rand(7), @color)
    rescue
      puts "Invalid Move"
      retry
    end
  end
end

g = Game.new
g.play
