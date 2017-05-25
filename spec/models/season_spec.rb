require "rails_helper"

RSpec.describe Season, type: :model do
  context "relationships" do
    it { should belong_to(:league) }
    it { should have_many(:games) }
    it { should have_many(:players).through(:games) }
    it { should have_many(:participants).through(:players) }
  end

  context "methods" do
    before do
      @season = create(:season)
    end

    it "#average_pot_size" do
      games = create_list(:game, 2, season: @season, completed: true)
      create_list(:player, 10, game: games[0])
      create_list(:player, 20, game: games[1])

      expect(@season.average_pot_size).to eq(1650)
    end

    it "#games_count - 0" do
      expect(@season.game_count).to eq(0)
    end

    it "#game_count - 1" do
      game = create(:game, season: @season)
      expect(@season.reload.game_count).to eq(1)
    end

    it "#leader" do
      league = @season.league
      other_season = create(:season, league: league)
      game_1 = create(:game, season: @season)
      game_2 = create(:game, season: other_season)
      participants = create_list(:participant, 2, user: league.user)
      player_1 = create(:player, participant: participants[0], game: game_1)
      player_2 = create(:player, participant: participants[1], game: game_2)

      expect(@season.leader).to eq(participants[0])
      expect(other_season.leader).to eq(participants[1])
    end

    it "#player_count - 2" do
      game = create(:game, season: @season)
      create_list(:player, 2, game: game)
      expect(@season.player_count).to eq(2)
    end

    it "#players_per_game - 1.0" do
      game = create(:game, season: @season)
      create(:player, game: game)
      expect(@season.players_per_game).to eq(1.0)
    end

    it "#players_per_game - 1.5" do
      game_1 = create(:game, season: @season)
      create_list(:player, 2, game: game_1)
      game_2 = create(:game, season: @season)
      create(:player, game: game_2)
      expect(@season.players_per_game).to eq(1.5)

    end

    it "#total_pot_size" do
      games = create_list(:game, 2, season: @season)
      create_list(:player, 10, game: games[0])
      create_list(:player, 13, game: games[1])
      expect(@season.total_pot_size).to eq(2530)
    end
  end
end
