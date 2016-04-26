class SessionsController < ApplicationController
  # login handler
  def create
    user = User.find_by_email(params[:email])
    # byebug
    begin
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_messages_path(user.id)
      else
        flash[:error] = 'Email or password is incorrectly.'
        render 'new'
      end

    rescue BCrypt::Errors::InvalidHash
      Rails.logger.fatal "Invalid password of user with id #{user.id}"
      flash[:error] = 'Your account is invalid. Please register a new account or contact our admin.'
      render 'new'
    end
  end

  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_path
  # end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      # log in user here
      # binding.pry
      session[:user_id] = user.id
      redirect_to snippets_path
    else
      # don't log user in
      flash[:error] = 'Your account is not existed. Please sign in with the Facebook account with its email in our system.'
      render 'new'
    end
  end

  private
  def login_params
    params.permit(:email, :password)
  end
end
