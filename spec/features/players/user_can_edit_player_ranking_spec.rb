require "rails_helper"

RSpec.describe "User can edit player ranking", type: :feature do
  before do
    @game = create(:game)
    @league = @game.league
    @player = create(:player, game: @game)
    user = @game.league.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "from new_league_game_player_path", js: true do
    visit new_league_game_player_path(@league, @game)
    click_link "[Edit]"

    expect(current_path).to eq(edit_league_game_player_path(@league, @game, @player))

    # within("div.input-field.player-list") do
    #   find("input-select-dropdown").click
    #   find("li", text: @participant_1.first_name).click
    # end
    find("input.select-dropdown").click
    find("li", text: "2").click
    fill_in "Additional Buy-In or Add-Ons", with: 1
    click_button "Update Player"

    expect(current_path).to eq(new_league_game_player_path(@league, @game))

    expect(page).to have_content("2 #{@player.participant.first_name} #{@player.participant.last_name}")
  end
end
