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

    it "#actual_pot" do
      expect(@game.actual_pot).to eq(110)
    end

    it "#available_places" do
      expect(@game.available_places.count).to eq(9)
    end

    it "#estimated_or_pot - incomplete game" do
      expect(@game.estimated_or_pot).to eq(1000)
    end
    it "#estimated_or_pot - complete game" do
      @game.update(completed: true)
      expect(@game.estimated_or_pot).to eq(110)
    end

    it "#finished_players" do
      player_2 = create(:player, game: @game)
      player_2.update(finishing_place: nil)
      expect(@game.finished_players).to eq([@player])
    end

    it "#finished_players_count_greater_than_zero - true" do
      expect(@game.finished_players_count_greater_than_zero).to be true
    end

    it "#finished_players_count_greater_than_zero - false" do
      game_2 = create(:game)
      expect(game_2.finished_players_count_greater_than_zero). to be false
    end

    it "#in_place - 1" do
      expect(@game.in_place(1)).to eq(@player)
    end

    it "#in_place - 1" do
      new_player = create(:player, game: @game, finishing_place: 3)
      expect(@game.in_place(3)).to eq(new_player)
    end

    it "#player_count" do
      expect(@game.player_count).to eq(1)
    end
  end
end
