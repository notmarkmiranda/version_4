require "rails_helper"

RSpec.describe Player, type: :model do
  before do
    participant = create(:participant)
    game = create(:game)
  end

  context "validations" do
    before { create(:player) }
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:game_id) }
    it { should validate_uniqueness_of(:participant_id).scoped_to(:game_id) }
  end

  context "relationships" do
    it { should belong_to(:participant) }
    it { should belong_to(:game) }
  end

  context "methods" do
    before do
      game = create(:game, buy_in: 15)
      @player = create(:player, game: game, additional_expense:0)
      @player_2 = create(:player, game: game, additional_expense: 0, finishing_place: 2)
      @player_3 = create(:player, game: game, additional_expense: 0, finishing_place: 3)
    end

    it "#score" do
      expect(@player.score).to eq(3.354)
      expect(@player_2.score).to eq(2.236)
      expect(@player_3.score).to eq(1.677)
    end

    it "#past_season_scores" do
      
    end
  end
end
