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
      flash[:success] = "League created!"
      redirect_to @league
    else
      flash[:danger] = "Something went wrong!"
      render :new
    end
  end

  def edit
    @league = League.find_by_slug(params[:id])
  end

  def update
    @league = League.find_by_slug(params[:id])
    if @league.update(league_params!)
      flash[:success] = "League updated!"
      redirect_to @league
    else
      flash[:danger] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    league = League.find_by_slug(params[:id])
    league.destroy
    redirect_to dashboard_path
  end

  private

  def league_params!
    params.require(:league).permit(:name)
  end

end
