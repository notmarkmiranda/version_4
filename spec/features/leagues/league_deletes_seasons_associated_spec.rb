require "rails_helper"

RSpec.describe "deleting a league deletes the associated seasons", type: :feature do
  before do
    @league = create(:league)
    user = @league.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "deletes the associated seasons" do
    visit dashboard_path
    find(".delete-league-#{@league.slug} > input").click
    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_content(@league.name)
  end
end
