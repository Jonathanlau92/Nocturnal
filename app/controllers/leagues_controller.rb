class LeaguesController < ApplicationController
  def index
    @league = League.find_by(current_league: true)
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
  
  def brackets
    @round1_matches = Match.where(round: 1)
    @round2_matches = Match.where(round: 2)
    @round3_matches = Match.where(round: 3)
    @round4_matches = Match.where(round: 4)
    @round5_matches = Match.where(round: 5)
  end
end
