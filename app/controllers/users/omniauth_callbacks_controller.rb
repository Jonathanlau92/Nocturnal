# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :steam
  def steam
    # Linking existing user to omniauth so that it wont create another user record
    if user_signed_in?
      # Calls link_account_from_omniauth method in user model
      if current_user.link_account_from_omniauth(request.env["omniauth.auth"])
        flash[:notice] = "Account successfully linked"
        redirect_to root_path and return
      end
    end
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Steam") if is_navigational_format?
    else
      session["devise.steam_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
end
