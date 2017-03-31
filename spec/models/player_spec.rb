require "rails_helper"

RSpec.describe Player, type: :model do
  before do
    participant = create(:participant)
    game = create(:game)
  end

  context "validations" do
    it { should validate_presence_of(:participant_id) }
    it { should validate_presence_of(:game_id) }
    xit { should validate_uniqueness_of(:participant_id).scoped_to(:game_id) }
  end

  context "relationships" do
    it { should belong_to(:participant) }
    it { should belong_to(:game) }
  end
end
