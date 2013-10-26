require 'spec_helper'

describe Game do
    let(:game) { Game.new }

  describe ".new" do
    it "creates a new Game and sets the number of players" do
      Game.any_instance.stub(:gets).and_return(2)
      expect(game).to be_an_instance_of Game
      expect(game.number_of_players).to eq(2)
    end
  end

  describe "#number_of_players" do
    it "returns the number of players" do
      Game.any_instance.stub(:gets).and_return(2)
      expect(game.number_of_players).to eq(2)
    end
  end

  describe "#start" do
  end
end
