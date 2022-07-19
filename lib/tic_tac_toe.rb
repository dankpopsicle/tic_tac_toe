class TicTacToe
  attr_reader :board

  @@play_counter = 0
  
  def initialize(board, player_input, player)
    @board = board
    @player_input = player_input
    @player = player
    @@play_counter += 1
  end

  def new_board
    @board.each do |row|
      if row.include?(@player_input)
        row[row.find_index(@player_input)] = @player
      end
    end
    @board
  end

  def game_over
    @board.each do |row|
      if row.all?("X")
        puts "Player One is the winner!"
        return true
      elsif row.all?("O")
        puts "Player Two is the winner!"
        return true
      elsif @@play_counter == 9
        puts "It's a tie!"
        return true
      else false
      end
    end
    @board.transpose.each do |column|
      if column.all?("X")
        puts "Player One is the winner!"
        return true
      elsif column.all?("O")
        puts "Player Two is the winner!"
        return true
      elsif @@play_counter == 9
        puts "It's a tie!"
        return true
      else false
      end
    end
    if ((@board[0][0] == @board[1][1]) && (@board[1][1] == @board[2][2])) || ((@board[0][2] == @board[1][1]) && (@board[1][1] == @board[2][0])) && (@board[1][1] == "X")
      puts "Player One is the winner!"
      return true
    elsif ((@board[0][0] == @board[1][1]) && (@board[1][1] == @board[2][2])) || ((@board[0][2] == @board[1][1]) && (@board[1][1] == @board[2][0])) && (@board[1][1] == "O")
      puts "Player Two is the winner!"
      return true
    else false
    end
  end
end

def play_game
  board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  player_one = true
  player = "X"
  game_over = false
  player_input = 0
  p board[0], board[1], board[2]
  loop do
    player_input = 0
    if player_one == true
      player = "X"
      player_one = false
      puts "Player One: please enter a number"
    else player = "O"
      player_one = true
      puts "Player Two: please enter a number"
    end
    until player_input > 0 && player_input < 10
      player_input = gets.to_i
      if player_input < 0 || player_input > 9
        puts "please try a different number" 
      end
    end
    round = TicTacToe.new(board, player_input, player)
    board = round.new_board
    p board[0], board[1], board[2]
    game_over = round.game_over
    if game_over == true
      break
    end
  end
end

play_game
