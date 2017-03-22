require "rails_helper"

RSpec.describe "Visitor is redirected to login page if attempting to visit '/dashboar'", type: :feature do
  it "redirects to login page" do
    visit dashboard_path
    expect(current_path).to eq(login_path)
  end
end
