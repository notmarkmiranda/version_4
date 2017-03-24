class LeaguesController < ApplicationController
  def show
    @league = League.find_by_slug(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = current_user.leagues.new(league_params!)
    if @league.save
      @league.update(slug: @league.to_param)
      flash[:success] = "League created!"
      redirect_to @league
    end
  end

  def edit
    @league = League.find_by_slug(params[:id])
  end

  def update
    @league = League.find_by_slug(params[:id])
    if @league.update(league_params!)
      @league.update(slug: @league.to_param)
      flash[:success] = "League updated!"
      redirect_to @league
    end
  end

  private

  def league_params!
    params.require(:league).permit(:name)
  end
end
