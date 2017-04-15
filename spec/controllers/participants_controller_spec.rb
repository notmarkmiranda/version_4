require "rails_helper"

RSpec.describe ParticipantsController, type: :controller do
  before do
    @participant = create(:participant)
    other_particiapnt = create(:participant)
    user = @participant.user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it "GET index - template" do
    get :index
    expect(response).to render_template(:index)
  end

  it "GET index - assigns" do
    get :index
    expect(assigns[:participants]).to eq([@participant])
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
    expect(response).to redirect_to(root_path)
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

  it "GET edit - template" do
    get :edit, params: { id: @participant.id }
    expect(response).to render_template(:edit)
  end

  it "GET edit - assigns" do
    get :edit, params: { id: @participant.id }
    expect(assigns[:participant]).to eq(@participant)
  end

  it "PUT update - happy template" do
    new_attrs = attributes_for(:participant)
    patch :update, params: { id: @participant.id, participant: new_attrs}
    expect(response).to redirect_to(participant_path(@participant))
  end

  it "PUT update - sad template" do
    patch :update, params: { id: @participant.id, participant: { first_name: "" } }
    expect(response).to render_template(:edit)
  end
end
