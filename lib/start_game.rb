
def start_game
  starter = true
  game = Game.new
  count = 1
  while starter
    game.new_board unless count == 1
    game.new_player unless count == 1
    game.game
    starter = game.new_game
    count += 1
  end
end