
class Board
  attr_accessor :board
  def initialize
    @board = {
      '1'=>1,
      '2'=>2,
      '3'=>3,
      '4'=>4,
      '5'=>5,
      '6'=>6,
      '7'=>7,
      '8'=>8,
      '9'=>9
    }
  end
  def print_board
    row1 = " #{@board['1']} | #{@board['2']} | #{@board['3']} "
    row2 = " #{@board['4']} | #{@board['5']} | #{@board['6']} "
    row3 = " #{@board['7']} | #{@board['8']} | #{@board['9']} "
    shape = row1 + "\n" + row2+ "\n" +row3
  end
  def rows(player)
    row_arr1 = [@board['1'], @board['2'], @board['3']].all?{|x| x==player.symbol}
    row_arr2 = [@board['4'], @board['5'], @board['6']].all?{|x| x==player.symbol}
    row_arr3 = [@board['7'], @board['8'], @board['9']].all?{|x| x==player.symbol}
    [row_arr1, row_arr2, row_arr3].any?
  end
  def cols(player)
    col_arr1 = [@board['1'], @board['4'], @board['7']].all?{|x| x==player.symbol}
    col_arr2 = [@board['2'], @board['5'], @board['8']].all?{|x| x==player.symbol}
    col_arr3 = [@board['3'], @board['6'], @board['9']].all?{|x| x==player.symbol}
    [col_arr1, col_arr2, col_arr3].any?
  end
  def diags(player)
    diag_arr1 = [@board['1'], @board['5'], @board['9']].all?{|x| x==player.symbol}
    diag_arr2 = [@board['7'], @board['5'], @board['3']].all?{|x| x==player.symbol}
    [diag_arr1, diag_arr2].any?
  end
end