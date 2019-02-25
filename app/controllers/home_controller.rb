class HomeController < ApplicationController
  before_action :check_and_reroute

  def index; end

  private

  def check_and_reroute
    # redirect_to uploads_path if session[:user_id]
  end
end
