class UsersController < ApplicationController
  before_filter :require_user, only: [:show]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params!)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account Created!"
      redirect_to dashboard_path
    else
      flash[:danger] = "Something went wrong!"
      render :new
    end
  end

  private

  def user_params!
    params.require(:user).permit(:email, :password)
  end
end
