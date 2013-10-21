require 'spec_helper'

describe Word do
    let(:hi) { Word.new('hi') }
    let(:home) { Word.new('home') }
    let(:ward) { Word.new('ward') }
    let(:word) { Word.new('word') }
    let(:hello) { Word.new('hello') }
    let(:sound) { Word.new('sound') }
    let(:silence) { Word.new('silence') }

  describe ".new" do
    it "creates a word object with a string argument" do
      expect(Word.new("string")).to be_an_instance_of Word
    end

    it "creates a word object with a string argument and a multipliers array" do
      expect(Word.new("hello", [nil, :double, :single, nil, :triple])).to be_an_instance_of Word
    end

    it "creates a word object with a string argument and a multipliers array" do
      expect(Word.new("hello", [nil, :double, :single, nil, :triple])).to be_an_instance_of Word
    end

    it "raises an exception with no string argument" do
      expect( -> { Word.new }).to raise_error ArgumentError
    end
  end

  describe ".highest_score_from" do
    it "returns the word with the highest score" do
      expect(Word.highest_score_from([home, word, hello, sound])).to eq(home)
    end

    it "returns the word with fewer letters if two words produce same score" do
      expect(Word.highest_score_from([hello, word, sound])).to eq(word)
    end

    it "give bonus to seven letter words" do
      expect(Word.highest_score_from([home, word, silence])).to eq(silence)
    end

    it "returns the earliest word when there are multiple with the same length and score" do
      expect(Word.highest_score_from([hi, word, ward])).to eq(word)
    end
  end

  describe "#letters" do
    let(:word) { Word.new("string") }

    it "returns the words letters" do
      expect(word.letters).to eq(["s", "t", "r", "i", "n", "g"])
    end
  end

  describe "#letter_scores" do
    let(:word) { Word.new("string") }

    it "returns the words letter scores" do
      expect(word.letter_scores).to eq([1, 1, 1, 1, 1, 2])
    end
  end

  describe "#score" do
    let(:word1) { Word.new("hello") }
    let(:word2) { Word.new("hello", [nil, :double, :single, nil, :triple]) }

    it "returns the word's score" do
      expect(word1.score).to eq(8)
      expect(word2.score).to eq(11)
    end
  end
end
