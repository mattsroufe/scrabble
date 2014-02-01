class Game
  attr_reader :number_of_players
  
  def initialize
    print "Welcome to terminal Scrabble.\n" \
          "How many players: "
    @number_of_players = gets.to_i
  end

  def start
    while Player.all.count < number_of_players
      print "Player #{Player.count + 1} name: "
      Player.new(gets.chomp)
    end
    pick_first_player
    score_board
  end

  def score_board
    puts "PLAYER | SCORE"
    puts "--------------"
    Player.all.each do |player|
      puts "#{player.name} | #{player.score}"
    end
    puts "Total letters remaining: #{Letter.remaining.count}\n"
  end

private

  def pick_first_player
    puts "picking letters to see who goes first..."
    sleep(1)
    Player.all.each do |player|
      player.selects_letters(1)
      puts "#{player.name} - #{player.letters.first}"
      sleep(1)
    end
    puts "#{Player.all.min_by(&:letters).name} gets to go first."
    Letter.reset_letters
  end
end
