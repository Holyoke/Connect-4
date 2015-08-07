require "byebug"

class Board
  attr_reader :board
  def initialize(cols = 7, rows = 6)
    @cols, @rows = cols, rows
    @board = create_board
  end

  def create_board
    board = []
    @cols.times do
      board << Array.new(@rows)
    end

    board
  end

  def fill_column(col, piece)
    raise "Invalid move, pick a column between 0 and #{7 - 1}" if col > 6

    free_slots = @board[col].count { |el| el.nil? }
    raise "Invalid move, column #{col} is full" if free_slots == 0

    blank_idx = @rows - free_slots
    @board[col][blank_idx] = piece

    puts
    puts display
  end

  def display
    @board.map do |row|
      row.map do |piece|
        piece.nil? ? '[ ]' : "[#{piece}]"
      end.join
    end.join("\n")
  end

  def won?
  end
end
