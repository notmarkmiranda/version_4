require "rails_helper"

RSpec.describe Participant, type: :model do
  context "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of(:first_name).scoped_to(:last_name) }
  end

  context "relationships" do
    it { should belong_to :user }
    it { should have_many :players }
  end

  context "methods" do
    before do
      @league = create(:league)
      @season = @league.seasons.first
      @participant = create(:participant)
    end

    it "#global_attendance" do
      game_1 = create(:game, season: @season)
      game_2 = create(:game, season: @season)
      player_1 = create(:player, participant: @participant, game: game_1)

      expect(@participant.global_attendance(@league)).to eq(50.0)
    end

    it "#global_score" do
      game_1 = create(:game, season: @season)
      player_1 = create(:player, participant: @participant, game: game_1)

      expect(@participant.global_score(@league)).to eq(4.767)
    end

    it "#global_win_or_placed - 100%" do
      game_1 = create(:game, season: @season)
      player_1 = create(:player, participant: @participant, game: game_1, finishing_place: 1)

      expect(@participant.global_win_or_placed(@league)).to eq(100.0)
    end

    it "#global_win_or_placed - 50%" do
      game_1 = create(:game, season: @season)
      game_2 = create(:game, season: @season)
      player_1 = create(:player, participant: @participant, game: game_1, finishing_place: 1)
      player_2 = create(:player, participant: @participant, game: game_2, finishing_place: 4)

      expect(@participant.global_win_or_placed(@league)).to eq(50.0)
    end

    it "#global_win_or_placed - 66.6%" do
      game_1 = create(:game, season: @season)
      game_2 = create(:game, season: @season)
      game_3 = create(:game, season: @season)
      player_1 = create(:player, participant: @participant, game: game_1, finishing_place: 1)
      player_2 = create(:player, participant: @participant, game: game_2, finishing_place: 4)
      player_3 = create(:player, participant: @participant, game: game_3, finishing_place: 3)

      expect(@participant.global_win_or_placed(@league)).to eq(2 / 3.0 * 100)
    end

    it "#longest_streak" do
      game_1   = create(:game, date: Date.new(2017, 01, 01), buy_in: 100, completed: true, season_id: @season.id, attendees: 10)
      game_2   = create(:game, date: Date.new(2017, 02, 01), buy_in: 100, completed: true, season_id: @season.id, attendees: 10)
      game_3   = create(:game, date: Date.new(2017, 03, 01), buy_in: 100, completed: true, season_id: @season.id, attendees: 10)
      game_4   = create(:game, date: Date.new(2017, 04, 01), buy_in: 100, completed: true, season_id: @season.id, attendees: 10)
      game_5   = create(:game, date: Date.new(2017, 05, 01), buy_in: 100, completed: true, season_id: @season.id, attendees: 10)
      player_1 = create(:player, participant: @participant, finishing_place: 1, game: game_1)
      player_2 = create(:player, participant: @participant, finishing_place: 2, game: game_2)
      player_3 = create(:player, participant: @participant, finishing_place: 3, game: game_3)
      player_4 = create(:player, participant: @participant, finishing_place: 4, game: game_4)
      player_5 = create(:player, participant: @participant, finishing_place: 1, game: game_5)
      # creates streak of 3 with a 4th place finish in between another 1st place finish

      expect(@participant.longest_streak(@league)).to eq(3)
    end

    it "#player_count - 1" do
      create(:player, participant: @participant)
      expect(@participant.player_count).to eq(1)
    end

    it "#player_count - 4" do
      create_list(:player, 4, participant: @participant)
      expect(@participant.player_count).to eq(4)
    end

    it "#top_three_count" do
      create_list(:player, 2, participant: @participant)
      create(:player, participant: @participant, finishing_place: 4)
      expect(@participant.top_three_count).to eq(2)
    end

  end
end
