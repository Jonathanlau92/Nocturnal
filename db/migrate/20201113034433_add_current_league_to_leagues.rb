class AddCurrentLeagueToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :current_league, :boolean, default: false
  end
end
