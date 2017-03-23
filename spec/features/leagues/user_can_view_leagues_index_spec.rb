require "rails_helper"

RSpec.describe "User can view leagues index", type: :feature do
  context "with no leagues" do
    before do
      user = create(:user)
      league = create(:league)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "they see no leagues" do
      visit dashboard_path
      expect(page).to have_content("You have no leagues. Create one to get started.")
    end
  end

  context "with leagues" do
    before do
      user = create(:user)
      @league1, @league2 = create_list(:league, 2, user: user)
      @league3 = create(:league)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it "they can only view their own leagues" do
      visit dashboard_path
      expect(page).to have_content(@league1.name)
      expect(page).to have_content(@league2.name)
      expect(page).to_not have_content(@league3.name)
    end
  end
end
