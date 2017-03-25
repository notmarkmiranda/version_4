require "rails_helper"

RSpec.describe Season, type: :model do
  context "relationships" do
    it { should belong_to(:league) }
  end
end
