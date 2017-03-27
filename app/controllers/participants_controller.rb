class ParticipantsController < ApplicationController
  def index
    @participants = current_user.participants
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = current_user.participants.new(participant_params!)
    if @participant.save
      flash[:success] = "New Player Created!"
      redirect_to @participant
    else
      flash[:danger] = "Something went wrong!"
      render :new
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params!)
      flash[:success] = "Player Updated!"
      redirect_to @participant
    else
      flash[:danger] = "Something went wrong!"
      render :edit
    end
  end

  private

  def participant_params!
    params.require(:participant).permit(:first_name, :last_name)
  end
end
