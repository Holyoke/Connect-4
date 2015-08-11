require "board.rb"

describe "Winning Conditions" do
  before :all do
    @board = Board.new
  end

  context "Columns Check" do
    it "checks first column earlier slots" do

      @board.board = [
        [:w, :w, :w, :w, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
      ]

      expect(@board.won?).to eq(true)
    end

    it "checks first column later slots" do

      @board.board = [
        [:b, :b, :b, :w, :w, :w, :w],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
      ]

      expect(@board.won?).to eq(true)
    end

    it "checks last column early slots" do

      @board.board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [:w, :w, :w, :w, nil, nil, nil]
      ]

      expect(@board.won?).to eq(true)
    end

    it "checks last column later slots" do

      @board.board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [:w, :w, :w, :b, :b, :b, :b]
      ]

      expect(@board.won?).to eq(true)
    end
  end

  context "Rows Check" do
    it "checks bottom rows, columns 0 to 3" do

      @board.board = [
        [:w, nil, nil, nil, nil, nil, nil],
        [:w, nil, nil, nil, nil, nil, nil],
        [:w, nil, nil, nil, nil, nil, nil],
        [:w, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil]
      ]
      expect(@board.won?).to eq(true)
    end

    it "checks bottom rows, columns 3 to 6" do

      @board.board = [
        [:w, nil, nil, nil, nil, nil, nil],
        [:w, nil, nil, nil, nil, nil, nil],
        [:w, nil, nil, nil, nil, nil, nil],
        [:w, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil]
      ]

      expect(@board.won?).to eq(true)
    end

    it "checks bottom rows, columns 0 to 3" do

      @board.board = [
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, :b],
        [nil, nil, nil, nil, nil, nil, :b],
        [nil, nil, nil, nil, nil, nil, :b],
        [nil, nil, nil, nil, nil, nil, :b]
      ]

      expect(@board.won?).to eq(true)
    end
  end

  context "diagonal / rows"
  it "checks / diaganols from the SW corner" do

    @board.board = [
      [:b, nil, nil, nil, nil, nil, nil],
      [nil, :b, nil, nil, nil, nil, nil],
      [nil, nil, :b, nil, nil, nil, nil],
      [nil, nil, nil, :b, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]
    ]

    expect(@board.won?).to eq(true)
  end

  it "checks / diaganols toward the middle" do

    @board.board = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, :b, nil, nil, nil, nil],
      [nil, nil, nil, :b, nil, nil, nil],
      [nil, nil, nil, nil, :b, nil, nil],
      [nil, nil, nil, nil, nil, :b, nil],
      [nil, nil, nil, nil, nil, nil, nil]
    ]

    expect(@board.won?).to eq(true)
  end

  it "checks / diaganols at the last column" do

    @board.board = [
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, :b, nil, nil, nil, nil],
      [nil, nil, nil, :b, nil, nil, nil],
      [nil, nil, nil, nil, :b, nil, nil],
      [nil, nil, nil, nil, nil, :b, nil]
    ]

    expect(@board.won?).to eq(true)
  end
  context 'diagonal \ rows' do
    it "checks / diaganols at the NW corner" do
      @board.board = [
        [nil, nil, nil, nil, nil, nil, :b],
        [nil, nil, nil, nil, nil, :b, nil],
        [nil, nil, nil, nil, :b, nil, nil],
        [nil, nil, nil, :b, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil]
      ]

      expect(@board.won?).to eq(true)
    end

    it "checks / diaganols ending at the last column" do
      @board.board = [
        [1, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, :b, nil, nil, nil],
        [nil, nil, :b, nil, nil, nil, nil],
        [nil, :b, nil, nil, nil, nil, nil],
        [:b, nil, nil, nil, nil, nil, nil]
      ]

      expect(@board.won?).to eq(true)
    end
  end

end
