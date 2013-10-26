require 'spec_helper'

describe Letter do
  describe ".alls" do
    it "returns a has of all the letters" do
      expect(Letter.all).to eq(
         { ""  => {:score => 0,  :count => 2},
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
      )
    end
  end
  describe ".score" do
    it "scores a single letter" do
      expect(Letter.score("f")).to eq(4)
    end
  end

  describe ".count" do
    it "returns the number of letters left" do
      expect(Letter.count).to eq(100)
    end
  end

  describe ".reset_letters" do
    it "resets Letter.remaing to the original letter values" do
      expect(Letter.count).to eq(100)
      Letter.remove("f")
      expect(Letter.count).to eq(99)
      Letter.reset_letters
      expect(Letter.count).to eq(100)
    end
  end

  describe ".remove" do
    before do
      Letter.reset_letters
    end

    it "removes the given letter from the letter bank" do
      Letter.remove("f")
      expect(Letter.remaining["F"]).to eq({:score=>4, :count=>1})
    end

    it "lowers the letter count by 1" do
      Letter.remove("f")
      expect(Letter.count).to eq(99)
    end
  end

  describe ".multiplier" do
    it "returns the multiplier's value" do
      expect(Letter.multiplier(:double)).to eq(2)
      expect(Letter.multiplier(:single)).to eq(1)
    end
  end
end
