class Api::UserController < Api::APIApplicationController
  def index
    render json: authenticate_token, root: false
  end
end
