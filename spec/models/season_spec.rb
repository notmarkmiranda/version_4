require "rails_helper"

RSpec.describe Season, type: :model do
  context "relationships" do
    it { should belong_to(:league) }
    it { should have_many(:games) }
  end

  context "methods" do
    before do
      @season = create(:season)
    end

    it "#games_count - 0" do
      expect(@season.game_count).to eq(0)
    end

    it "#game_count - 1" do
      game = create(:game, season: @season)
      expect(@season.reload.game_count).to eq(1)
    end
  end
end
