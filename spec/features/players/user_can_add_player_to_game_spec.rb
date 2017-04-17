require "rails_helper"

RSpec.describe "User can add player to game", type: :feature do
  before do
    @game = create(:game)
    @league = @game.league
    user = @league.user
    @participant_1 = create(:participant, user: user)
    @participant_2 = create(:participant, user: user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "can add a player from the dashboard", js: true do
    visit dashboard_path
    expect(page).to have_content("Unscored Games: 1")
    click_link("1")

    expect(current_path).to eq(league_games_path(@league))
    click_link("score game")

    expect(current_path).to eq(new_league_game_player_path(@league, @game))
    within("div.input-field.player-list") do
      find("input.select-dropdown").click
      find("li", text: @participant_1.first_name).click
    end

    within("div.input-field.finishing-place") do
      find("input.select-dropdown").click
      find("li", text: "3").click
    end

    fill_in "Additional Buy-In or Add-Ons", with: "100"

    click_button "Score Player"

    expect(current_path).to eq(new_league_game_player_path(@league, @game))
    expect(page).to have_content("3 #{@participant_1.first_name} #{@participant_1.last_name}")

    within("div.input-field.player-list") do
      find("input.select-dropdown").click
      find("li", text: @participant_2.first_name).click
    end

    within("div.input-field.finishing-place") do
      find("input.select-dropdown").click
      find("li", text: "2").click
    end

    click_button "Score Player"

    expect(current_path).to eq(new_league_game_player_path(@league, @game))

    expect(page).to have_content("2 #{@participant_2.first_name} #{@participant_2.last_name}")
    click_button "Finalize Game"

    expect(current_path).to eq(league_game_path(@league, @game))
    expect(page).to have_content("#{@participant_2.first_name} #{@participant_2.last_name} - 2 - 4.71")
    expect(page).to have_content("#{@participant_1.first_name} #{@participant_1.last_name} - 3 - 2.5")
    # scores something something
  end
end
