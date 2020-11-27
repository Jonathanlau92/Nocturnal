class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery prepend: true
  
  def after_sign_in_path_for(resource)
    if resource.steam_authentication_data.present?
      stored_location_for(resource) || root_path
    else
      edit_user_path(resource)
    end
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
end
