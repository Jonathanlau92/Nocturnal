class LeaguesController < ApplicationController
	def index
		
	end

	def team_details
		
	end

	def participants
    if params[:team].present?
      @teams = Team.all
    else
		  @users = User.all
    end
    @default_image = Image.first
	end
end
