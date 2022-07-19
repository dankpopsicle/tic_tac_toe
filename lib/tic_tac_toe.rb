class TicTacToe
  attr_reader :board
  attr_reader :play_counter

  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    @player_input = 0
    @position = 1
    @play_counter = 0
  end

  def play_game
    print_board
    until self.game_over?
      player_one_move
      game_end if self.game_over?
      if self.game_over? != true
        player_two_move
        game_end if self.game_over?
      end
    end
  end

  def game_over?
    full_board? || winner?("X") || winner?("O")
  end

  def full_board?
    @play_counter == 9
  end

  def game_end
    puts "It's a tie!" if full_board?
    puts "Player one wins!" if winner?("X")
    puts "Player two wins!" if winner?("O")
  end

  def winner?(symbol)
    temp_board = @board.transpose
    value = false
    @board.each do |row|
      if row.all?(symbol)
        value = true
        break
      end
    end
    if value == false
      temp_board.each do |row|
        if row.all?(symbol)
          value = true
          break
        end
      end
    end
    value
  end

  def player_one_move
    puts 'Player One: please enter a number from the board'
    @player_input = get_player_input
    new_board("X")
    self.print_board
    @play_counter += 1
  end

  def player_two_move
    puts 'Player Two: please enter a number from the board'
    @player_input = get_player_input
    new_board("O")
    self.print_board
    @play_counter += 1
  end

  def get_player_input
    player_input = gets.chomp.to_i
    input_valid?(player_input) ? player_input : input_invalid
  end

  def input_valid?(player_input)
    value = false
    @board.each do |row|
      if row.include?(player_input)
        value = true
      end
    end
    value
  end

  def input_invalid
    puts "Please enter a number from the board"
    get_player_input
  end

  def new_board(symbol)
    @board.each do |row|
      if row.include?(@player_input)
        row[row.find_index(@player_input)] = symbol
      end
    end
    @board
  end

  def print_board
    p @board[0], @board[1], @board[2]
  end
end
