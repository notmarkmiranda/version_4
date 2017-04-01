require "rails_helper"

RSpec.describe Leagues::GamesController, type: :controller do
  before do
    @game = create(:game)
    @league = @game.league
  end

  it "GET show - template" do
    get :show, params: { league_id: @league.slug, id: @game.id }
    expect(response).to render_template :show
  end

  it "GET show - assigns" do
    get :show, params: { league_id: @league.slug, id: @game.id }
    expect(assigns[:game]).to eq(@game)
  end

  it "GET new - template" do
    get :new, params: { league_id: @league.slug }
    expect(response).to render_template(:new)
  end

  it "GET new - assigns league" do
    get :new, params: { league_id: @league.slug }
    expect(assigns[:league]).to eq(@league)
  end

  it "GET new - assigns game" do
    get :new, params: { league_id: @league.slug }
    expect(assigns[:game]).to be_a_new(Game)
  end

  it "POST create - happy template" do
    attrs = attributes_for(:game)
    post :create, params: { league_id: @league.slug, game: attrs }
    expect(response).to redirect_to(league_game_path(@league, Game.last))
  end

  it "POST create - sad template" do
    post :create, params: { league_id: @league.slug, game: { buy_in: 100 } }
    expect(response).to render_template(:new)
  end

  it "POST create - happy change database" do
    attrs = attributes_for(:game)
    expect {
      post :create, params: { league_id: @league.slug, game: attrs }
    }.to change(Game, :count).by(1)
  end

  it "POST create - sad change database" do
    expect {
      post :create, params: { league_id: @league.slug, game: { buy_in: 100 } }
    }.to_not change(Game, :count)
  end
end
