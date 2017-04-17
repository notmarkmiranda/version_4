require "rails_helper"

RSpec.describe "logged in user can create a participant" do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  xit "creates a new participant" do
    visit root_path
    within("ul#dropdown1") do
      click_link("New Player")
    end

    expect(current_path).to eq(new_participant_path)
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    click_button "Create Player!"

    expect(current_path).to eq(new_participant_path)
    expect(page).to have_content("John Doe")
  end
end
