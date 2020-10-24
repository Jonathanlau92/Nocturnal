class UsersController < ApplicationController
  before_action :set_user, except: :update_heroes_images
  include Adapter

  def show
    @user_heroes = ProfileImage.where(user: @user).pluck(:image_id)
    @profile_images = @user.profile_images
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
    @dota_api_call = OpenDota.new(@user)
    ProfileImage.where(user_id: @user.id).destroy_all
    # Store the images in an array and then assign to user
    params[:heroes_image_ids].first(4).each do |hero_image_id|
      # Pass in image name to get hero stats
      @hero_stat = @dota_api_call.get_hero_stat(Image.find(hero_image_id).name)
      if @hero_stat.present?
        # If API call returns a hero, then store the statistics into the database
        ProfileImage.create(user_id: @user.id, image_id: hero_image_id, games_played: @hero_stat["games"], win_rate: @hero_stat["win"], with_games: @hero_stat["with_games"], with_win: @hero_stat["with_win"])
      else
        #else, just create a profile picture with nil stats
        ProfileImage.create(user_id: @user.id, image_id: hero_image_id)
      end
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
