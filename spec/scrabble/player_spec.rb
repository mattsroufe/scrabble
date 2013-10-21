require 'spec_helper'

describe Player do
  let(:player1) { Player.new("Julius") }
  let(:player2) { Player.new("Vincent") }

  before do
    Player.stub(:all).and_return([])
  end

  def create_players
    player1; player2
  end

  describe ".new" do
    it "creates a player object with a name argument" do
      expect(player1).to be_an_instance_of Player
      expect(Player.all).to match_array([player1])
    end
  end

  describe ".all" do
    it "returns the an array of all players" do
      expect(Player.all).to match_array([])
      create_players
      expect(Player.all).to match_array([player1, player2])
    end
  end

  describe ".find_by" do
    it "finds the first player matching the method and value" do
      create_players
      expect(Player.find_by(:name => "Vincent")).to eq(player2)
    end
  end

  describe "#selects_letters" do
    it "adds the number of letters to the player's collection" do
      player1.selects_letters
      expect(player1.letters.count).to eq(7)
    end
  end

  describe "#plays" do
    it "calculates the score of the player's word" do
      player1.letters = ['h','e','l','l','o','w','p']
      player1.plays("hello")
      expect(player1.score).to eq(8)
    end

    it "removes the letter from the player's collections" do
      player1.letters = ['h','e','l','l','o','w','p']
      player1.plays("hello")
      expect(player1.letters).to eq(['w','p'])
    end

    it "raises an error if enters impossilbe play" do
      player1.letters = ['h','e','l','l','o']
      expect( -> { player1.plays("world") }).to raise_error(RuntimeError)
    end
  end

  describe "#score" do
    it "calculates the player's total score" do
      player1.letters = ['h','e','l','l','o','h','o','m','e','z']
      player1.plays("hello")
      player1.plays("home")
      expect(player1.score).to eq(17)
    end
  end

  describe "#leading?" do
    it "determines if the player's score is higher than the player compared against" do
      player1.letters = ['h','e','l','l','o','w','p']
      player2.letters = ['s','o','u','n','d','w','p']
      player1.plays("hello")
      player2.plays("sound")
      expect(player1.leading?(player2)).to be_true
      expect(player2.leading?(player1)).to be_false
    end
  end

  describe "#letters" do
    it "returns the player's letters" do
      expect(player1.letters).to eq([])
    end
  end

  describe "#add_letter" do
    it "adds a single letter to the player's collection" do
      player1.add_letter('i')
      expect(player1.letters).to eq(['i'])
    end
  end

  describe "#add_letters" do
    it "adds letters to the player's collection" do
      player1.add_letters(['i', 'n', 'd'])
      expect(player1.letters).to eq(['i', 'n', 'd'])
    end
  end

  describe "#can_play?" do
    it "adds letters to the player's collection" do
      player1.letters = ['w', 'a', 'n', 'd', 'x', 'e', 'j']
      expect(player1.can_play?('wand')).to be_true
      expect(player1.can_play?('ween')).to be_false
    end
  end
end
