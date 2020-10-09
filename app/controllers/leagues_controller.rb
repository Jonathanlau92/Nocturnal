class LeaguesController < ApplicationController
	def index
		
	end

	def team_details
		
	end

	def participants
		@users = User.all
	end
end
