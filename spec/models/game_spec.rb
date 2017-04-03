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
end
