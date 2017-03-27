require "rails_helper"

RSpec.describe "user can edit participants", type: :feature do
  before do
    @participant = create(:participant)
    user = @participant.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "allows a user to edit participants from partcipants index page" do
    visit participants_path
    within(".participant-#{@participant.id}") do
      click_link("edit player")
    end
    fill_in "First Name", with: "Super"
    fill_in "Last Name", with: "Duper"
    click_button "Update Player!"

    expect(current_path).to eq(participant_path(@participant))
    expect(page).to have_content("Super Duper")
    expect(page).to_not have_content(@participant.first_name)
    expect(page).to_not have_content(@participant.last_name)
  end

  it "allows a user to edit a participant from the participant show page" do
    visit participant_path(@participant)
    click_link("edit player")
    fill_in "First Name", with: "New"
    fill_in "Last Name", with: "Update"
    click_button "Update Player!"

    expect(current_path).to eq(participant_path(@participant))
    expect(page).to have_content("New Update")
    expect(page).to_not have_content(@participant.first_name)
    expect(page).to_not have_content(@participant.last_name)
  end
end
