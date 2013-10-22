require 'spec_helper'

describe Game do

  describe ".new" do
    it "prints the score out to the screen" do
      Game.any_instance.stub(:gets)
      expect(Game.new).to be_an_instance_of Game
      player1 = Player.new("Matt")
      player2 = Player.new("Bonnie")
      expect(Player.all).to eq([player1, player2])
    end
  end
end
