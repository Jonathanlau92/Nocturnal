class UsersController < ApplicationController
  before_action :set_user, except: :update_heroes_images

  def show
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'User updated successfully.'
    else
      redirect_to root_path, notice: 'Error in updating users.'
    end
  end

  def update_heroes_images
    @user = User.find(params[:user_id])
    # Store the images in an array and then assign to user
    params[:heroes_image_id].each do |hero_image_id|
      ProfileImage.create(user_id: @user.id, image_id: hero_image_id)
    end
    redirect_to user_path(@user), notice: 'User images added successfully.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :age, :country, :profile_picture, :cover_photo, :position)
  end
end
