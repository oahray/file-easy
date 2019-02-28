class SessionsController < ApplicationController
  before_action :reroute_valid_session, only: :new

  def new; end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}"
      redirect_to uploads_url
    else
      flash[:warning] = "Email or password is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:success] = "You have logged out. Please come back soon!"
  end
end
