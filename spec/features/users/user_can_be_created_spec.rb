require "rails_helper"

RSpec.describe "User can be created", type: :feature do
  it "creates and logs a user in from the home screen" do
    # As a user
    # I can visit the root path
    visit root_path
    # click on New Account
    # first(:link, "New Account").click
    within(".hide-on-med-and-down") do
      click_link "New Account"
    end
    # fill in my email and password
    fill_in "E-Mail Address", with: "test@example.com"
    fill_in "Password", with: "password"
    # click on button Create Account
    click_button "Create Account"
    # and will be redirected to the dashboard_path
    expect(current_path).to eq(dashboard_path)
    within(".hide-on-med-and-down") do
      # the page will not have a log in link
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("New Account")
      # the page will have a log out link
      expect(page).to have_link("Log Out")
    end
  end
end
