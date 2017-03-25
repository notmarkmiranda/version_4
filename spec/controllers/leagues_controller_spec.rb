require "rails_helper"

RSpec.describe LeaguesController, type: :controller do
  it "GET show - template" do
    league = create(:league)
    get :show, params: { id: league.slug }
    expect(response).to render_template(:show)
  end

  it "GET show - assigns" do
    league = create(:league)
    get :show, params: { id: league.slug }
    expect(assigns[:league]).to eq(league)
  end

  it "GET new - template" do
    get :new
    expect(response).to render_template(:new)
  end

  it "GET new - assigns" do
    get :new
    expect(assigns[:league]).to be_a_new(League)
  end

  it "POST create - happy template" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    attrs = attributes_for(:league)
    post :create, params: { league: attrs }
    expect(response).to redirect_to(league_path(League.last))
  end

  it "POST create - sad template" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    post :create, params: { league: { name: "" } }
    expect(response).to render_template(:new)
  end

  it "GET edit - template" do
    league = create(:league)
    get :edit, params: { id: league.slug }
    expect(response).to render_template(:edit)
  end

  it "GET edit - assigns" do
    league = create(:league)
    get :edit, params: { id: league.slug }
    expect(assigns[:league]).to eq(league)
  end

  it "PATCH update - happy template" do
    league = create(:league)
    patch :update, params: { id: league.slug, league: { name: "yup!" } }
    league.reload
    expect(response).to redirect_to(league_path(league))
  end

  it "PATCH update - sad template" do
    league = create(:league)
    patch :update, params: { id: league.slug, league: { name: "" } }
    league.reload
    expect(response).to render_template(:edit)
  end

end
