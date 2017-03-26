require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  before do
    @user = create(:user)
  end

  it "GET new - template" do
    get :new
    expect(response).to render_template :new
  end

  it "POST create - happy template" do
    post :create, params: { session: { email: @user.email, password: "password" } }
    expect(response).to redirect_to(dashboard_path)
  end

  it "POST create - sad template" do
    post :create, params: { session: { email: @user.email, password: "pass" } }
    expect(response).to render_template(:new)
  end

  it "GET destroy - template" do
    get :destroy
    expect(response).to redirect_to(root_path)
  end
end
