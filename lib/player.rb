
class Player
  attr_reader :symbol
  @@available_symbol = ['X', 'O']
  @@remaining_symbol = Array.new
  def initialize
    @symbol = player_id(nil)
  end
  def player_id (symbol)
    if @@available_symbol.size > 1
      puts 'Select your symbol, either X or O'
      while symbol != 'X' && symbol != 'O'
        symbol = gets.chomp
        symbol.upcase!
        puts symbol != 'X' && symbol != 'O' ? "Please select X or O as your symbol" : "Cool! #{symbol} choosen"
      end
      puts @@remaining_symbol = @@available_symbol.reject!{|x| x == symbol}
      symbol
    elsif @@available_symbol.size > 0
      puts "next player gets the #{@@remaining_symbol[0]} symbol"
      symbol = @@remaining_symbol[0]
      @@remaining_symbol = @@available_symbol.reject!{|x| x == symbol}
      symbol
    else
      puts 'No more players can be created'
    end
  end
  def restart
    @@available_symbol = ['X', 'O']
    @@remaining_symbol = Array.new
  end
end