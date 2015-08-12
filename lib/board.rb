class Board
  attr_accessor :board
  attr_reader :cols, :height

  def initialize(cols = 7, height = 6)
    @cols, @height = cols, height
    @board = create_board
  end

  def create_board
    board = []
    @cols.times do
      board << Array.new(@height)
    end

    board
  end

  def fill_column(col, piece)
    raise "Invalid move, pick a column between 0 and #{@cols - 1}" if col > @height

    free_slots = @board[col].count { |el| el.nil? }
    raise "Invalid move, column #{col} is full" if free_slots == 0

    blank_idx = @height - free_slots
    @board[col][blank_idx] = piece

    puts "#{piece} placed at #{col}, #{blank_idx}"
    puts
    puts display
  end

  def display
    display = ""

    @height.downto(0) do |level|
      @board.each do |row|
        piece = row[level]
        display += piece.nil? ? "[ ]" : "[#{piece}]"
      end
      display += "\n"
    end

    display += (0..6).map {|x| " #{x} "}.join
    display
  end

  def won?
    return check_columns || check_rows || check_upward_diaganols || check_downward_diaganols
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

  def check_upward_diaganols
    (0..3).each do |col_idx|
      (0..3).each do |col_height|
        diagonal_group = find_upward_diaganol_starting_at(col_idx, col_height)
        if diagonal_group.all?{ |el| diagonal_group.first == el && !el.nil?}
          return true
        end
      end
    end

    false
  end

  def find_upward_diaganol_starting_at(col_idx, col_height)
    diagonal_group = []

    (col_idx..(col_idx + 3)).each_with_index do |col, height|
      diagonal_group << board[col][col_height + height]
    end

    diagonal_group
  end

  def check_downward_diaganols
    (0..3).each do |col_idx|
      (3..6).each do |col_height|
        diagonal_group = find_downward_diaganol_starting_at(col_idx, col_height)
        if diagonal_group.all?{ |el| diagonal_group.first == el && !el.nil?}
          return true
        end
      end
    end

    false
  end

  def find_downward_diaganol_starting_at(col_idx, col_height)
    diagonal_group = []

    (col_idx..(col_idx + 3)).each_with_index do |col, height|
      diagonal_group << board[col][col_height - height]
    end

    diagonal_group
  end

end
