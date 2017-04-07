require "rails_helper"

RSpec.describe Game, type: :model do
  context "validations" do
    it { should validate_presence_of :date }
    it { should validate_presence_of :buy_in }
    it { should validate_presence_of :season_id }
    it { should validate_presence_of :attendees }
  end

  context "relationships" do
    it { should belong_to :season }
    it { should have_many :players }
    it { should delegate_method(:league).to(:season) }
  end

  context "methods" do
    before do
      @player = create(:player)
      @game   = @player.game
    end

    it "#finished_players" do
      player_2 = create(:player, game: @game)
      player_2.update(finishing_place: nil)
      expect(@game.finished_players).to eq([@player])
    end

    it "#player_count" do
      expect(@game.player_count).to eq(1)
    end

    it "#score_game" do
      expect(@player.score).to be nil
      @game.score_game
      @player.reload
      expect(@player.score).to eq(4.74)
    end
  end
end
