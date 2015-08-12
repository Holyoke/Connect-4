class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def play_turn(board)
    begin
      board.fill_column(get_pos, @color)
    rescue Exception => e
      puts e
      retry
    end
  end

  private

  def get_pos
    rand
  end
end

class ComputerPlayer < Player
  private
  def get_pos
    rand(7)
  end
end

class HumanPlayer < Player
  private
  def get_pos
    rand(7)
  end
end
