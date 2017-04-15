class Leagues::Games::PlayersController < ApplicationController
  def new
    @league = League.find_by_slug(params[:league_id])
    @game = Game.find(params[:game_id])
    @player = @game.players.new
    @participant = current_user.participants.new
  end

  def create
    @league = League.find_by_slug(params[:league_id])
    @game = Game.find(params[:game_id])
    @player = @game.players.new(player_params!)
    if @player.save
      flash[:success] = "Player Scored!"
      redirect_to new_league_game_player_path(@league, @game)
    else
      flash[:danger] = "Something Went Wrong!"
      render :new
    end
  end

  private

  def player_params!
    params.require(:player).permit(:participant_id, :finishing_place, :additional_expense)
  end
end
