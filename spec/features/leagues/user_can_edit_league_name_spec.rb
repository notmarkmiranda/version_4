require "rails_helper"

RSpec.describe "User can edit a league name" do
  before do
    @league = create(:league)
    user = @league.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "edits the leagues name and slug - from dashboard" do
    visit dashboard_path
    within('.' + @league.slug) do
      click_link "edit league name"
    end

    expect(current_path).to eq(edit_league_path(@league))
    fill_in "League Name", with: "Mark Miranda Super Dope League"
    click_button "Submit League Changes"

    @league.reload

    expect(current_path).to eq(league_path(@league))
    expect(page).to have_content("Mark Miranda Super Dope League")
  end

  it "edits the leagues name and slug - from league show page" do
    visit league_path(@league)
    click_link("edit league name")

    expect(current_path).to eq(edit_league_path(@league))
    fill_in "League Name", with: "Second Test"
    click_button "Submit League Changes"

    @league.reload

    expect(current_path).to eq(league_path(@league))
    expect(page).to have_content("Second Test")
  end
end
