require "rails_helper"

RSpec.describe PagesController, type: :controller do
  it "GET home - template" do
    get :home
    expect(response).to render_template(:home)
  end

  it "Get not_found - template" do
    get :not_found
    expect(response).to render_template(:not_found)
  end
end
