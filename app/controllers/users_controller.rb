class UsersController < ApplicationController
  before_action :reroute_valid_session, only: %i[new]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    redirect_to signup_path
  end

  def show
    redirect_to uploads_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to uploads_path
      flash[:success] = "Account creation successful"
    else
      redirect_to signup_path
      flash[:error] = @user.errors.full_messages.to_sentence
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User account was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
