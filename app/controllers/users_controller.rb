class UsersController < ApplicationController
  before_action :set_user
  
  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User updated successfully.'
    else
      redirect_to root_path, notice: 'Error in updating users.'
    end
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
