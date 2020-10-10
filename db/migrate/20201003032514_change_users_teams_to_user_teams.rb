class ChangeUsersTeamsToUserTeams < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_teams, :user_teams
  end
end
