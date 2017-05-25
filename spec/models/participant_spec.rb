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
    it "#longest_streak" do
      league = create(:league)
      season = league.seasons.first
      participant = create(:participant)
      game_1 = create(:game, date: Date.new(2017, 01, 01), buy_in: 100, completed: true, season_id: season.id, attendees: 10)
      player_1 = create(:player, participant: participant, finishing_place: 1, game: game_1)
      game_2 = create(:game, date: Date.new(2017, 02, 01), buy_in: 100, completed: true, season_id: season.id, attendees: 10)
      player_2 = create(:player, participant: participant, finishing_place: 2, game: game_2)
      game_3 = create(:game, date: Date.new(2017, 03, 01), buy_in: 100, completed: true, season_id: season.id, attendees: 10)
      player_3 = create(:player, participant: participant, finishing_place: 3, game: game_3)
      game_4 = create(:game, date: Date.new(2017, 04, 01), buy_in: 100, completed: true, season_id: season.id, attendees: 10)
      player_4 = create(:player, participant: participant, finishing_place: 4, game: game_4)
      game_5 = create(:game, date: Date.new(2017, 05, 01), buy_in: 100, completed: true, season_id: season.id, attendees: 10)
      player_5 = create(:player, participant: participant, finishing_place: 1, game: game_5)
      # creates streak of 3 with a 4th place finish in between another 1st place finish

      expect(participant.longest_streak(league)).to eq(3)
    end
  end
end
