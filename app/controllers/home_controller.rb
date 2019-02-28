class HomeController < ApplicationController
  before_action :reroute_valid_session

  def index; end
end
