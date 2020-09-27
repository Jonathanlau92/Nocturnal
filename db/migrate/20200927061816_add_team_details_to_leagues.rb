class AddTeamDetailsToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :moderator, :string
    add_column :leagues, :lobby_id, :string
    add_column :leagues, :lobby_password, :string
    add_column :leagues, :discord_link, :string
  end
end
