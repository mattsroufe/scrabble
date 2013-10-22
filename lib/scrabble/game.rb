class Game
  attr_reader :number_of_players
  
  def initialize
    print "Welcome to terminal Scrabble.\n" \
          "How many players: "
    @number_of_players = gets.to_i
  end

  def start
    create_players(number_of_players)
    Player.all.each do |player|
      puts "#{player.id} - #{player.name}"
    end
    coin_toss
    puts "Total letters remaining: #{Letter.count}\n"
  end

  def create_players(number_of_players)
    while Player.all.count < number_of_players
      print "Player #{Player.count + 1} name: "
      Player.new(gets.chomp)
    end
  end

  def coin_toss
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
