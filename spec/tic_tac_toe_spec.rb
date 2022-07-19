require_relative '../lib/tic_tac_toe_new'

describe TicTacToe do
  describe '#game_over?' do
    subject(:game_complete) { described_class.new }

    it 'ends the game with three in a row' do
      game_complete.board[0] = ["X", "X", "X"]
      game_over = game_complete.game_over?
      expect(game_over).to eql(true)
    end
  end

  describe '#full_board?' do
    subject(:full_board) { described_class.new }

    before { full_board.instance_variable_set(:@play_counter, 9)}

    it 'ends game when board is full' do
      game_over = full_board.game_over?
      expect(game_over).to eql(true)
    end
  end

  describe '#input_valid?' do
    subject(:invalid_input) { described_class.new }
    it 'returns false with an invalid input' do
      input = invalid_input.input_valid?("test")
      expect(input).to eql(false)
    end

    subject(:valid_input) { described_class.new}
    it 'returns true with a valid input' do
      input = valid_input.input_valid?(1)
      expect(input).to eql(true)
    end
  end

end