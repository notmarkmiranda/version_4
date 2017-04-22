require "rails_helper"

RSpec.describe Leagues::Games::PlayersController, type: :controller do
  before do
    @game = create(:game)
    @league = @game.league
    @participant = create(:participant)
    user = @participant.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
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

  it "POST create - sad template" do
    attrs = attributes_for(:player)
    post :create, params: { league_id: @league.slug, game_id: @game.id, player: attrs }
    expect(response).to render_template(:new)
  end

  it "POST create - happy changes database" do
    attrs = attributes_for(:player).merge(participant_id: @participant.id)
    expect {
      post :create, params: { league_id: @league.slug, game_id: @game.id, player: attrs }
    }.to change(Player, :count).by(1)
  end

  it "POST create - sad changes database" do
    attrs = attributes_for(:player)
    expect {
      post :create, params: { league_id: @league.id, game_id: @game.id, player: attrs }
    }.to_not change(Player, :count)
  end

  it "GET edit - template" do
    player = create(:player, game: @game, participant: @participant)
    get :edit, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(response).to render_template(:edit)
  end

  it "GET edit - assigns league" do
    player = create(:player, game: @game, participant: @participant)
    get :edit, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(assigns[:league]).to eq(@league)
  end

  it "GET edit - assigns game" do
    player = create(:player, game: @game, participant: @participant)
    get :edit, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(assigns[:game]).to eq(@game)
  end

  it "GET edit - assigns player" do
    player = create(:player, game: @game, participant: @participant)
    get :edit, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(assigns[:player]).to eq(player)
  end

  it "GET edit - assigns participant" do
    player = create(:player, game: @game, participant: @participant)
    get :edit, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(assigns[:participant]).to eq(player.participant)
  end

  it "PATCH update - happy template" do
    player = create(:player, game: @game, participant: @participant, finishing_place: 1)
    patch :update, params: { league_id: @league.slug, game_id: @game.id, id: player.id, player: { finishing_place: 2 } }
    expect(response).to redirect_to new_league_game_player_path(@league, @game)
  end

  it "PATCH update - sad template" do
    player = create(:player, game: @game, participant: @participant, finishing_place: 1)
    patch :update, params: { league_id: @league.slug, game_id: @game.id, id: player.id, player: { participant_id: 99999} }
    expect(response).to redirect_to new_league_game_player_path(@league, @game)
  end

  it "DELETE destroy - template" do
    player = create(:player, game: @game, participant: @participant, finishing_place: 1)
    delete :destroy, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(response).to redirect_to new_league_game_player_path(@league, @game)
  end

  it "DELETE destroy - assigns league" do
    player = create(:player, game: @game, participant: @participant, finishing_place: 1)
    delete :destroy, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(assigns[:league]).to eq(@league)
  end

  it "DELETE destroy - assigns game" do
    player = create(:player, game: @game, participant: @participant, finishing_place: 1)
    delete :destroy, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    expect(assigns[:game]).to eq(@game)
  end

  it "DELETE destory - changes database" do
    player = create(:player, game: @game, participant: @participant, finishing_place: 1)
    expect {
      delete :destroy, params: { league_id: @league.slug, game_id: @game.id, id: player.id }
    }.to change(Player, :count).by(-1)

  end
end
