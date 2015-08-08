require "byebug"

class Board
  attr_writer :board
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
    @board.map do |col|
      col.map do |piece|
        piece.nil? ? '[ ]' : "[#{piece}]"
      end.join
    end.join("\n")
  end

  def won?
    return check_columns || check_rows
  end

  private

  def check_columns(board = @board)
    board.each do |col|
      (0..3).each do |idx|
        won = col[idx..(idx + 3)].all? { |el| el == col[idx] && !el.nil? }
        return true if won
      end
    end

    false
  end

  def check_rows
    transposed_board = @board.transpose
    check_columns(transposed_board)
  end
end
