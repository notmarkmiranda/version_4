require "rails_helper"

RSpec.describe "User can schedule games", type: :feature do
  before do
    @league = create(:league)
    user = @league.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "from the dashboard" do
    visit dashboard_path
    within(".league-actions") do
      click_link "schedule game"
    end

    expect(current_path).to eq(new_league_game_path(@league))
    fill_in "Date", with: "17 April, 2016"
    fill_in "Buy In", with: "100"
    fill_in "Number of Players", with: "10"
    click_button "Schedule Game!"

    expect(current_path).to eq(league_game_path(@league, Game.last))
    expect(page).to have_content("April 17, 2016")
    expect(page).to have_content("$100.00")
  end

  it "from the league show page" do
    visit league_path(@league)
    within(".league-actions") do
      click_link "schedule game"
    end

    expect(current_path).to eq(new_league_game_path(@league))
    fill_in "Date", with: "17 April 2016"
    fill_in "Number of Players", with: "10"
    fill_in "Buy In", with: "50"
    click_button "Schedule Game!"

    expect(current_path).to eq(league_game_path(@league, Game.last))
    expect(page).to have_content("April 17, 2016")
    expect(page).to have_content("$50.00")
  end
end
