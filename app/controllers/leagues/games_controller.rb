class Leagues::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @league = League.find_by_slug(params[:league_id])
    @game = @league.current_season_games.new
  end

  def create
    @league = League.find_by_slug(params[:league_id])
    @game = @league.current_season_games.new(game_params!)
    if @game.save
      flash[:success] = "Your game has been scheduled!"
      redirect_to league_game_path(@league, @game)
    else
      flash[:danger] = "Something went wrong!"
      render :new
    end
  end

  def game_params!
    params.require(:game).permit(:date, :buy_in, :season_id)
  end
end
