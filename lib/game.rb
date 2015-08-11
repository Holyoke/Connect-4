require_relative 'board'

class Game
  def initialize(columns = 7, height = 6)
    @board = Board.new(columns, height)
    @players = {
      white: HumanPlayer.new(:w),
      black: HumanPlayer.new(:b)
    }
    @current_player = :white
  end

  def play
    turns = 0
    max_turns = @board.cols * @board.height

    until @board.won? || turns >= max_turns
      turns += 1
      @current_player = (turns % 2 == 0) ? :black : :white
      @players[@current_player].play_turn(@board)
    end

    puts "#{@current_player} won!"
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
    rescue Exception => e
      puts e
      retry
    end
  end
end

game = Game.new
game.play
