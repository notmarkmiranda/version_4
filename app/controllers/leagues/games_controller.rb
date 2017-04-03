class Leagues::GamesController < ApplicationController
  def index
    league = League.find_by_slug(params[:league_id])
    if params[:type] == "unscored"
      @games = league.unscored_games
    end
  end

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

  def update
    @game = Game.find(params[:id])
    if params[:type] == "finalize"
      @game.update(completed: true)
      flash[:success] = "Your game has been scored"
      redirect_to
    end
  end

  private

  def game_params!
    params.require(:game).permit(:date, :buy_in, :season_id, :attendees)
  end
end
