require "rails_helper"

RSpec.describe LeaguesController, type: :controller do
  it "GET new - template" do
    get :new
    expect(response).to render_template(:new)
  end

  it "GET new - assigns" do
    get :new
    expect(assigns[:league]).to be_a_new(League)
    # expect(assigns[:user]).to be_a_new(User))
  end
end
