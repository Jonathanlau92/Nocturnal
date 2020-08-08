class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    if resource.steam_authentication_data.present? and resource.email.empty?
      edit_user_path(current_user)
    else
      stored_location_for(resource) || root_path
    end
  end
end
