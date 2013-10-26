class Letter

  LETTERS = { ""  => {:score => 0,  :count => 2},
              "A" => {:score => 1,  :count => 9},
              "B" => {:score => 3,  :count => 2},
              "C" => {:score => 3,  :count => 2},
              "D" => {:score => 2,  :count => 4},
              "E" => {:score => 1,  :count => 12},
              "F" => {:score => 4,  :count => 2},
              "G" => {:score => 2,  :count => 3},
              "H" => {:score => 4,  :count => 2},
              "I" => {:score => 1,  :count => 9},
              "J" => {:score => 8,  :count => 1},
              "K" => {:score => 5,  :count => 1},
              "L" => {:score => 1,  :count => 4},
              "M" => {:score => 3,  :count => 2},
              "N" => {:score => 1,  :count => 6},
              "O" => {:score => 1,  :count => 8},
              "P" => {:score => 3,  :count => 2},
              "Q" => {:score => 10, :count => 1},
              "R" => {:score => 1,  :count => 6},
              "S" => {:score => 1,  :count => 4},
              "T" => {:score => 1,  :count => 6},
              "U" => {:score => 1,  :count => 4},
              "V" => {:score => 4,  :count => 2},
              "W" => {:score => 4,  :count => 2},
              "X" => {:score => 8,  :count => 1},
              "Y" => {:score => 4,  :count => 2},
              "Z" => {:score => 10, :count => 1} }

  def self.all
    letters = []
    LETTERS.each do |k,v|
      LETTERS[k][:count].times do
        letters << k
      end
    end
    letters
  end

  MULTIPLIERS = {:single => 1, :double => 2, :triple => 3}

  def self.remaining
    @remaining ||= all
  end

  def self.reset_letters
    @remaining = all
  end

  def self.remove(letter)
    @remaining.delete_at(remaining.index(letter.upcase))
  end

  def self.select_random
    remaining.sample
  end

  def self.score(letter)
    LETTERS[letter.upcase][:score]
  end

  def self.multiplier(multiplier)
    MULTIPLIERS[multiplier]
  end
end
