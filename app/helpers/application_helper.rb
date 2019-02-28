module ApplicationHelper
  def reroute_invalid_session
    unless current_user
      redirect_to root_path
      flash[:notice] = "Please login to continue"
    end
  end

  def reroute_valid_session
    redirect_to uploads_path if current_user.present?
  end

  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when "success" then "alert-success"
    when "warning" then "alert-warning"
    when "error" then "alert-danger"
    when "alert" then "alert-warning"
    when "notice" then "alert-info"
    else flash_type.to_s
    end
  end
end
