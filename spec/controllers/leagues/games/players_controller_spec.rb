require "rails_helper"

RSpec.describe Leagues::Games::PlayersController, type: :controller do
  before do
    @game = create(:game)
    @league = @game.league
    @participant = create(:participant)
  end

  it "GET new - template" do
    get :new, params: { league_id: @league.slug, game_id: @game.id }
    expect(response).to render_template(:new)
  end

  it "GET new - assigns league" do
    get :new, params: { league_id: @league.slug, game_id: @game.id }
    expect(assigns[:league]).to eq(@league)
  end

  it "GET new - assigns game" do
    get :new, params: { league_id: @league.slug, game_id: @game.id }
    expect(assigns[:game]).to eq(@game)
  end

  it "GET new - assigns player" do
    get :new, params: { league_id: @league.slug, game_id: @game.id }
    expect(assigns[:player]).to be_a_new(Player)
  end

  it "POST create - happy template" do
    attrs = attributes_for(:player).merge(participant_id: @participant.id)
    post :create, params: { league_id: @league.slug, game_id: @game.id, player: attrs }
    expect(response).to redirect_to new_league_game_player_path(@league, @game)
  end

  it "POST create - sad template"
  it "POST create - happy changes database"
  it "POST create - sad changes database"
end
