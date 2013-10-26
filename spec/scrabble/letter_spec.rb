require 'spec_helper'

describe Letter do
  describe ".all" do
    it "returns a has of all the letters" do
      expect(Letter.all).to eq(["","","A","A","A","A","A","A","A","A","A","B","B","C","C","D","D","D","D","E","E","E","E","E","E","E","E","E","E","E","E","F","F","G","G","G","H","H","I","I","I","I","I","I","I","I","I","J","K","L","L","L","L","M","M","N","N","N","N","N","N","O","O","O","O","O","O","O","O","P","P","Q","R","R","R","R","R","R","S","S","S","S","T","T","T","T","T","T","U","U","U","U","V","V","W","W","X","Y","Y","Z"])
    end
  end

  describe ".remaining" do
    it "returns the remaining letters" do
      expect(Letter.remaining).to eq(["","","A","A","A","A","A","A","A","A","A","B","B","C","C","D","D","D","D","E","E","E","E","E","E","E","E","E","E","E","E","F","F","G","G","G","H","H","I","I","I","I","I","I","I","I","I","J","K","L","L","L","L","M","M","N","N","N","N","N","N","O","O","O","O","O","O","O","O","P","P","Q","R","R","R","R","R","R","S","S","S","S","T","T","T","T","T","T","U","U","U","U","V","V","W","W","X","Y","Y","Z"])
      expect(Letter.remaining.count).to eq(100)
    end
  end

  describe ".score" do
    it "scores a single letter" do
      expect(Letter.score("f")).to eq(4)
    end
  end

  describe ".reset_letters" do
    it "resets Letter.remaing to the original letter values" do
      expect(Letter.remaining.count).to eq(100)
      Letter.remove("f")
      expect(Letter.remaining.count).to eq(99)
      Letter.reset_letters
      expect(Letter.remaining.count).to eq(100)
    end
  end

  describe ".remove" do
    before do
      Letter.reset_letters
    end

    it "removes the given letter from the letter bank" do
      Letter.remove("f")
      expect(Letter.remaining.count).to eq(99)
    end

    it "lowers the letter count by 1" do
      Letter.remove("f")
      expect(Letter.remaining.count).to eq(99)
    end
  end

  describe ".multiplier" do
    it "returns the multiplier's value" do
      expect(Letter.multiplier(:double)).to eq(2)
      expect(Letter.multiplier(:single)).to eq(1)
    end
  end
end
