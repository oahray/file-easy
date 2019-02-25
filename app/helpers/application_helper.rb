module ApplicationHelper
  def confirm_session
    redirect_to root_path unless session[:user_id]
  end
end
