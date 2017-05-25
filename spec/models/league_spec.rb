require "rails_helper"

RSpec.describe League, type: :model do
  context "validations" do
    before { @league = create(:league) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:seasons).dependent(:destroy) }
    it { should have_many(:games).through(:seasons) }
  end

  context "methods" do
    before do
      @league = create(:league, name: "Super Duper", slug: "super-duper")
      @season = @league.seasons.first
    end

    it "#biggest_game" do
      game_1 = create(:game, season: @season, buy_in: 10, completed: true)
      player_1, player_2, player_3 = create_list(:player, 3, game: game_1)
      expect(@league.biggest_game).to eq(game_1)
    end

    it "#biggest_game with 2 games" do
      game_1 = create(:game, season: @season, buy_in: 10, completed: true)
      player_1, player_2, player_3 = create_list(:player, 3, game: game_1)
      game_2 = create(:game, season: @season, buy_in: 11, completed: true)
      player_4, player_5, player_6 = create_list(:player, 3, game: game_2)
      expect(@league.biggest_game).to eq(game_2)
    end

    it "#current_season" do
      expect(@league.current_season).to eq(@season)
    end

    it "#current_season_games" do
      game = create(:game, season: @season)
      expect(@league.current_season_games).to eq([game])
    end

    it "#game_count - 1" do
      game = create(:game, season: @season)
      expect(@league.game_count).to eq(1)
    end

    it "#game_count - 2" do
      games = create_list(:game, 2, season: @season)
      other_league = create(:league)
      other_game = create(:game, season: other_league.seasons.first)
      expect(@league.game_count).to eq(2)
    end

    it "#leader - with no players" do
      user = @league.user
      participant = create(:participant, user: user)
      expect(@league.leader).to eq(nil)
    end

    it "#leader with 3 participant / players" do
      user = @league.user
      participants = create_list(:participant, 3, user: user)
      game = create(:game, season: @season)
      player_1 = create(:player, participant: participants[0], game: game, finishing_place: 2)
      player_2 = create(:player, participant: participants[1], game: game, finishing_place: 3)
      player_3 = create(:player, participant: participants[2], game: game, finishing_place: 1)
      expect(@league.leader).to eq(participants[2])
    end

    it "#participant_count - 1" do
      user = @league.user
      participant = create(:participant, user: user)
      expect(@league.participant_count).to eq(1)
    end

    it "#participant_count - 3" do
      user = @league.user
      participants = create_list(:participant, 3, user: user)
      expect(@league.participant_count).to eq(3)
    end

    it "#seasons_count - 1" do
      expect(@league.seasons_count).to eq(1)
    end

    it "#seasons_count - 2" do
      create(:season, league: @league)
      expect(@league.seasons_count).to eq(2)
    end

    it "self#find_by_slug" do
      expect(League.find_by_slug("super-duper")).to eq(@league)
    end

    it "#to_param" do
      expect(@league.to_param).to eq("super-duper")
    end

    it "#unscored_games" do
      game = create(:game, season: @season)
      expect(@league.unscored_games).to eq([game])
    end


  end
end
