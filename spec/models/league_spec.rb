require "rails_helper"

RSpec.describe League, type: :model do
  context "validations" do
    before { create(:league) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:seasons) }
  end

  context "methods" do
    before do
      @league = create(:league, name: "Super Duper", slug: "super-duper")
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

  end
end
