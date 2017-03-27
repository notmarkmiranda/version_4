require "rails_helper"

RSpec.describe ParticipantsController, type: :controller do
  before do
    @participant = create(:participant)
    user = @participant.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "GET show - template" do
    get :show, params: { id: @participant.id }
    expect(response).to render_template(:show)
  end

  it "GET show - assigns" do
    get :show, params: { id: @participant.id }
    expect(assigns[:participant]).to eq(@participant)
  end

  it "GET new - template" do
    get :new
    expect(response).to render_template(:new)
  end

  it "GET new - assigns" do
    get :new
    expect(assigns[:participant]).to be_a_new(Participant)
  end

  it "POST create - happy template" do
    attrs = attributes_for(:participant)
    post :create, params: { participant: attrs }
    expect(response).to redirect_to(participant_path(Participant.last))
  end

  it "POST create - sad template" do
    post :create, params: { participant: { first_name: "Mark" } }
    expect(response).to render_template(:new)
  end

  it "POST create - happy changes database" do
    attrs = attributes_for(:participant)
    expect {
      post :create, params: { participant: attrs }
    }.to change(Participant, :count).by(1)
  end

  it "POST create - sad changes database" do
    expect {
      post :create, params: { participant: { first_name: "John" } }
    }.to_not change(Participant, :count)
  end
end
