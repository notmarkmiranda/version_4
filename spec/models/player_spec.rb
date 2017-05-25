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
      @player = create(:player)
    end

    it "#score" do
      expect(@player.score).to eq(4.74)
    end

    it "#raw_score" do
      season = @player.game.season
      expect(@player.raw_score).to eq(4.74)
      game_2 = create(:game, season: season)
      expect(@player.raw_score).to eq(2.37)
    end
  end
end
