class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    User.where(id: session[:user_id]).first
  end
  
  helper_method :current_user

  def ensure_logged_in
    redirect_to login_path unless current_user
  end

end
