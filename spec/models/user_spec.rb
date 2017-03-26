require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password_digest) }
  end

  context "relationships" do
    it { should have_many(:leagues) }
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
  end
end
