class ParticipantsController < ApplicationController

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

  private

  def participant_params!
    params.require(:participant).permit(:first_name, :last_name, :user_id)
  end
end
