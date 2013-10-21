require 'spec_helper'

describe Letter do
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

  describe ".remove" do
    before do
      Letter.stub(:all).and_return(Letter::COUNTS.dup)
    end

    it "removes the given letter from the letter bank" do
      Letter.remove("f")
      expect(Letter.all["F"]).to eq(1)
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
