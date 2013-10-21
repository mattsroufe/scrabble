class Letter

  COUNTS = {""=>2, "A"=>9, "B"=>2, "C"=>2, "D"=>4, "E"=>12, "F"=>2, "G"=>3, "H"=>2, "I"=>9, "J"=>1,
           "K"=>1, "L"=>4, "M"=>2, "N"=>6, "O"=>8, "P"=>2, "Q"=>1, "R"=>6, "S"=>4, "T"=>6,
           "U"=>4, "V"=>2, "W"=>2, "X"=>1, "Y"=>2, "Z"=>1}

  SCORES = {""=>0,"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
            "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
            "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10}

  MULTIPLIERS = {:single => 1, :double => 2, :triple => 3}

  def self.all
    @all ||= COUNTS.dup
  end

  def self.count
    all.values.inject { |sum, number| sum + number }
  end

  def self.remove(letter)
    all[letter.upcase] -= 1
  end

  def self.select_random
    letter = all.keys.sample
    remove(letter)
    letter
  end

  def self.score(letter)
    SCORES.each do |k, v|
      return v if k == letter.upcase
    end
  end

  def self.multiplier(multiplier)
    MULTIPLIERS.each do |k, v|
      return v if k == multiplier
    end
  end
end