require "board.rb"

describe "Winning Conditions" do
  context "Columns Check" do
    it "checks first column earlier slots" do
      board = Board.new
      board.board = [
        [:w, :w, :w, :w, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
      ]

      expect(board.won?).to eq(true)
    end

    it "checks first column later slots" do
      board = Board.new
      board.board = [
        [:b, :b, :b, :w, :w, :w, :w],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
      ]

      expect(board.won?).to eq(true)
    end

    it "checks last column early slots" do
      board = Board.new
      board.board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [:w, :w, :w, :w, nil, nil, nil]
      ]

      expect(board.won?).to eq(true)
    end

    it "checks last column later slots" do
      board = Board.new
      board.board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [:w, :w, :w, :b, :b, :b, :b]
      ]

      expect(board.won?).to eq(true)
    end
  end
  
  context "Rows Check" do

  end
  context "diagonal NE rows"
  context "diagonal SW rows"

end
