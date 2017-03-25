require "rails_helper"

RSpec.describe "a league should be instantiated with one season", type: :feature do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "starts with one active season" do
    visit dashboard_path
    click_link "Create League"
    fill_in "League Name", with: "Super Duper"
    click_button "Create League!"

    expect(current_path).to eq(league_path(League.last))
    expect(page).to have_content("Seasons: 1")
  end
end
