class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :require_user
  helper_method :set_redirect

  private

  def set_redirect
    if request.referer == new_participant_path
      session[:redirect] = participants_path
    else
      session[:redirect] = request.referer || root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to login_path unless current_user
  end
end
