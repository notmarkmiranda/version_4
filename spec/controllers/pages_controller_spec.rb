require "rails_helper"

RSpec.describe PagesController, type: :controller do
  it "GET home - template" do
    get :home
    expect(response).to render_template(:home)
  end
end
