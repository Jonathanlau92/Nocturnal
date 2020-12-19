class TeamsController < ApplicationController
  def show
    @team = Team.find(params[:id])
    # Assumption is that there can be only 1 current league
    @league = @team.leagues.where(current_league: true)[0]
  end
end
