class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless current_user
      flash[:notice] = "You need to login first."
      redirect_to root_path
    end
  end

  def authenticate_admin!
    unless current_user && current_user.is_admin?
      flash[:notice] = "Only admin can access this."
      redirect_to root_path
    end
  end

  
end
