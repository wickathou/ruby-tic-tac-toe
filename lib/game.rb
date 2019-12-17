
class Game
  attr_reader :player1
  attr_reader :player2
  attr_reader :count
  attr_accessor :board
  @@players = Array.new(2)
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @count = 1
    @@players[0] = @player1
    @@players[1] = @player2
  end

  def play(player)
    choice = nil
    while @board.board.values.include?(choice) != true
      puts 'Please select a valid position on the board'
      choice = gets.chomp.to_i
    end
    @board.board["#{choice}"] = player.symbol
    puts @board.print_board
    @count += 1
  end

  def new_board
    @board = Board.new
    @count = 1
  end

  def new_player
    puts "Do you want to restart the player's symbols? Put Y if yes or N if no"
    restart = ''
    while restart != 'Y' && restart != 'N'
      restart = gets.chomp
      restart.upcase!
      if restart != 'Y' && restart != 'N'
        puts "Please select Y or N"
      elsif restart == 'N'
        puts "Ok, player 1 keeps the #{@player1.symbol} symbol and player 2 keeps the #{@player2.symbol} symbol"
      elsif restart == 'Y'
        puts "Great, player symbols restarted"
        @player1.restart
        @player1 = Player.new
        @player2 = Player.new
        @@players[0] = @player1
        @@players[1] = @player2
      end
    end
  end

  def game
    player = 1
    puts @board.print_board
    while win(@@players[player]) == false && draw == false
      player%2 == 1 ? player = 0 : player = 1
      play(@@players[player])
    end
  end

  def win(player)
    if [@board.rows(player), @board.cols(player), @board.diags(player)].any?
      puts "Player #{player.symbol} wins!"
      true
    else
      puts "Next player moves"
      false
    end
  end

  def draw
    if @count > 9
      puts "This is a draw!"
      true
    else
      false
    end
  end

  def new_game
    option = ''
    while option != 'N' && option != 'Y'
      puts "Do you want to play again? Put Y if yes or N if no"
      option = gets.chomp
      option.upcase!
      puts option != 'Y' && option != 'N' ? "Please select Y or N as your option" : option != 'N'? "Ok! let's start a new game" : 'Thanks for playing!'
    end
    return option == 'Y' ? true : false
  end
end