require "rails_helper"

RSpec.describe League, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "relationships" do
    it { should belong_to(:user) }
  end
end
