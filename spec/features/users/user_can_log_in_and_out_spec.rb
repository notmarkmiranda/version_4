require "rails_helper"

RSpec.describe "User can log in and out", type: :feature do
  before do
    @user = create(:user)
  end

  it "logs in with good log in and logs them out" do
    visit root_path
    within(".right.hide-on-med-and-down") do
      click_link "Log In"
    end
    expect(current_path).to eq(login_path)
    fill_in "E-Mail Address", with: @user.email
    fill_in "Password", with: "password"
    click_button "Log In!"

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_link("Log In")

    within(".right.hide-on-med-and-down") do
      click_link("Log Out")
    end

    expect(current_path).to eq(root_path)
    within(".right.hide-on-med-and-down") do
      expect(page).to_not have_link("Log Out")
      expect(page).to have_link("Log In")
    end
  end

  it "cannot log in with bad password" do
    visit root_path
    within(".right.hide-on-med-and-down") do
      click_link "Log In"
    end
    expect(current_path).to eq(login_path)
    fill_in "E-Mail Address", with: @user.email
    fill_in "Password", with: "password1"
    click_button "Log In!"

    expect(current_path).to eq(login_path)
  end

  it "cannot log in with bad email" do
    visit root_path
    within(".right.hide-on-med-and-down") do
      click_link "Log In"
    end
    expect(current_path).to eq(login_path)
    fill_in "E-Mail Address", with: "a@b.com"
    fill_in "Password", with: "password"
    click_button "Log In!"

    expect(current_path).to eq(login_path)
  end

end
