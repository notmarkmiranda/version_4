require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password_digest) }
  end

  context "relationships" do
    it { should have_many(:leagues) }
    it { should have_many(:participants) }
  end

  context "methods" do
    before do
      @user = create(:user)
    end

    it "#no_leagues - true" do
      expect(@user.no_leagues).to be(true)
    end

    it "#no_leagues - false" do
      create(:league, user: @user)
      expect(@user.no_leagues).to be(false)
    end

    it "#unfinished_participants" do
      league = create(:league, user: @user)
      game   = create(:game, season: league.seasons.last)
      participant_1, participant_2 = create_list(:participant, 2, user: @user)
      player = create(:player, participant: participant_1, game: game)
      expect(@user.unfinished_participants(game)).to eq([participant_2])
    end
  end
end
