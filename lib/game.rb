require_relative 'board'
require_relative 'player'

class Game
  attr_reader :players, :board

  def initialize(
      player_one = ComputerPlayer.new(:w),
      player_two = ComputerPlayer.new(:b),
      columns = 7,
      height = 6
    )

    @board = Board.new(columns, height)
    @players = {
      white: player_one,
      black: player_two
    }
    @current_player = :white
    puts "Game initalized. Let's play!"
  end

  def play
    turns = 0
    max_turns = @board.cols * @board.height

    until @board.won? || turns >= max_turns
      turns += 1

      @current_player = (turns % 2 == 0) ? :white : :black

      puts
      puts "#{@current_player}'s turn..."
      puts

      @players[@current_player].play_turn(@board)
    end

    puts
    puts "#{@current_player.upcase} won!"
  end
end
