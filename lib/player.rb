require "byebug"

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play_turn(board)
    range = board.cols
    begin
      board.fill_column(get_pos(range), @color)
    rescue Exception => e
      puts e
      retry
    end
  end

  private

  def get_pos(*)
    raise "This is supposed to be abstract"
  end
end

class ComputerPlayer < Player
  private
  def get_pos(range)
    rand(range)
  end
end

class HumanPlayer < Player
  private
  def get_pos(range)
    value = -1
    until value.between?(0, range - 1)
      puts "Please select a column number between 0 and #{range - 1} "
      value = gets.chomp.to_i
    end
    value
  end
end
