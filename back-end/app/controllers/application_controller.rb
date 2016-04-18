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

  # include ActionController::HttpAuthentication::Token::ControllerMethods

  # # Add a before_action to authenticate all requests.
  # # Move this to subclassed controllers if you only
  # # want to authenticate certain methods.
  # before_action :authenticate

  # protected

  # # Authenticate the user with token based authentication
  # def authenticate
  #   authenticate_token || render_unauthorized
  # end

  # def authenticate_token
  #   authenticate_with_http_token do |token, options|
  #     @current_user = User.find_by(api_key: token)
  #   end
  # end

  # def render_unauthorized(realm = "Application")
  #   self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
  #   render json: 'Bad credentials', status: :unauthorized
  # end
end
