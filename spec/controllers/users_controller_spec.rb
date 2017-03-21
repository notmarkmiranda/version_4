require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "with user" do
    before do
      @user = create(:user)
      session[:user_id] = @user.id
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "GET show - template" do
      get :show
      expect(response).to render_template(:show)
    end

    it "GET show - assigns" do
      get :show
      expect(assigns[:user]).to eq(@user)
    end
  end

  describe "without_user" do
    it "GET new - template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "GET new - assigns" do
      get :new
      expect(assigns[:user]).to be_a_new(User)
    end

    it "POST create - happy template" do
      post :create, params: { user: attributes_for(:user) }
      expect(response).to redirect_to(dashboard_path)
    end

    it "POST create - sad template" do
      post :create, params: { user: { email: "test@example.com" } }
      expect(response).to render_template(:new)
    end

    it "POST create - assigns" do
      post :create, params: { user: attributes_for(:user) }
      expect(assigns[:user]).to eq(User.last)
    end

    it "POST create - happy change database" do
      expect { post :create, params: { user: attributes_for(:user) } }
        .to change(User, :count).by(1)
    end

    it "POST create - sad change database" do
      expect { post :create, params: { user: { email: "test@example.com" } } }
        .to_not change(User, :count)
    end
  end
end
