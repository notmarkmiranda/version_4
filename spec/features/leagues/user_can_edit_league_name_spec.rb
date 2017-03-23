require "rails_helper"

RSpec.describe "User can edit a league name" do
  before do
    @league = create(:league)
    user = @league.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "edits the leagues name and slug - from dashboard (index)" do
    visit dashboard_path
    within('.' + @league.slug) do
      click_link "Edit League Name"
    end

    expect(current_path).to eq(edit_league_path(@league))
    fill_in "League Name", with: "Mark Miranda Super Dope League"
    click_button "Submit League Changes"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("mark-miranda-super-dope-league")
    expect(page).to_not have_content(@league.slug)
  end
end
