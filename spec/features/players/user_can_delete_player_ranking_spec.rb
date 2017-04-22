require "rails_helper"

RSpec.describe "User can delete existing ranking", type: :feature do
  before do
    @game = create(:game)
    @league = @game.league
    @player = create(:player, game: @game)
    user = @game.league.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "deletes the player ranking" do
    visit new_league_game_player_path(@league, @game)
    click_button "[Delete]"

    expect(current_path).to eq(new_league_game_player_path(@league, @game))
    expect(page).to_not have_content(@player.participant.first_name)
    expect(page).to_not have_content(@player.participant.last_name)
  end
end
