class AddSteamIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :steam_id, :string
  end
end
