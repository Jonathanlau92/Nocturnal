class LeaguesController < ApplicationController
  def index
    
  end

  def team_details
    
  end

  def participants
    if params[:team].present?
      @teams = Team.all
    elsif params[:sort] == 'true'
      # LOWER to make it non-case sensitive
      @users = User.order('LOWER(username) ASC')
    else
      @users = User.all
    end
    @default_image = Image.first
  end
end
