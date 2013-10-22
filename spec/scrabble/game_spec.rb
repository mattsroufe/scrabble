require 'spec_helper'

describe Game do

  describe ".new" do
    let(:game) { Game.new }

    it "creates a new Game and sets the number of players" do
      Game.any_instance.stub(:gets).and_return(2)
      expect(game).to be_an_instance_of Game
      expect(game.number_of_players).to eq(2)
    end
  end
end
