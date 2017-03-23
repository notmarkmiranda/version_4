require "rails_helper"

RSpec.describe League, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "relationships" do
    it { should belong_to(:user) }
  end

  context "methods" do
    before do
      @league = create(:league, name: "Super Duper", slug: "super-duper")
    end

    it "#find_by_slug" do
      expect(League.find_by_slug("super-duper")).to eq(@league)
    end

    it "#to_param" do
      expect(@league.to_param).to eq("super-duper")
    end

  end
end
