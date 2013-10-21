class Player
  attr_reader :score, :name
  attr_accessor :letters

  def initialize(name)
    @name = name
    @score = 0
    @letters = []
    Player.all << self
  end

  def self.all
    @all ||= []
  end

  def self.find_by(args = {})
    Player.all.find { |player| player.send(args.keys[0]) == args.values[0] }
  end

  def selects_letters
    for i in letters.count...7 do
      letters << Letter.select_random
    end
  end

  def plays(string)
    raise RuntimeError, "#{name} cannot play '#{string}', has letters #{letters}." unless can_play?(string)
    word = Word.new(string)
    @score += word.score
    remove_letters(word.letters, letters)
  end

  def leading?(other_player)
    score > other_player.score
  end

  def add_letter(letter)
    @letters << letter
  end

  def add_letters(letters)
    @letters.concat(letters)
  end

  def can_play?(string)
    letters = string.split('')
    if letters.length <= @letters.length
      test_letters = @letters.dup
      remove_letters(letters, test_letters)
      if test_letters.length + letters.length == @letters.length
        true
      else
        false
      end
    else
      false
    end
  end

  def remove_letters(word_letters, player_letters)
    word_letters.each do |word_letter|
      player_letters.each_index do |i|
        player_letters.delete_at(i) if player_letters[i] == word_letter
        break
      end
    end
  end
end
