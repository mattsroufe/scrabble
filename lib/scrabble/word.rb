class Word
  attr_reader :letters, :multipliers

  def initialize(string, multipliers = [])
    @letters = string.split('')
    @multipliers = multipliers
  end

  def self.highest_score_from(words)
    highest_score = words.max_by(&:score).score
    words.delete_if { |word| word.score < highest_score }
    words.min_by(&:letter_count)
  end

  def letter_count
    letters.count
  end

  def letter_scores
    letters.map do |letter|
      Letter.score(letter)
    end
  end

  def score
    @score ||= calculate_score(letter_scores, multipliers)
  end

  def has_multiplier?(multiplier)
    multiplier == :double || multiplier == :triple
  end

  private

  def calculate_score(letter_scores, multipliers)
    score = letter_scores.zip(multipliers).inject(0) do |score, letter|
      has_multiplier?(letter[1]) ? score + letter[0] * Letter.multiplier(letter[1]) : score + letter[0]
    end
    letter_count == 7 ? score += 50 : score
  end
end
