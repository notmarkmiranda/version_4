require "rails_helper"

RSpec.describe "a logged in user can create a league from the dashboard", type: :feature do
  before do
  end

  it "creates a league" do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
    expect(page).to have_content("You have no leagues. Create one to get started.")
    click_link("Create League")
    fill_in "League Name", with: "Super League!"
    click_button("Create League!")

    expect(current_path).to eq(league_path(League.last))
    expect(page).to have_content("Super League!")
  end
end
