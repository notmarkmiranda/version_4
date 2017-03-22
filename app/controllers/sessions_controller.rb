class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You're logged in!"
      redirect_to dashboard_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end