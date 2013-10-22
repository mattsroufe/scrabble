class Game
  
  def initialize
    print "Welcome to terminal Scrabble.\n" \
          "How many players: "
    number_of_players = gets.to_i
    while Player.all.count < number_of_players
      make_new_player
    end
    puts Player.all
  end

  def make_new_player
    print "Player name: "
    name = gets
    player = Player.new(name)
  end
end
