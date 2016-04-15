class UsersController < ApplicationController
  before_action :authenticate_user!

  def reset_api_key
    current_user.api_key = current_user.generate_api_key
    current_user.save
    flash[:notice] = "Your API key has been reset."
    redirect_to root_path
  end
end
