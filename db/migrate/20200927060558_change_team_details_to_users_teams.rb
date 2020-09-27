class ChangeTeamDetailsToUsersTeams < ActiveRecord::Migration[6.0]
  def change
    rename_table :team_details, :users_teams
  end
end
