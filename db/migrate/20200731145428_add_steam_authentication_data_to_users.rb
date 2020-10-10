class AddSteamAuthenticationDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :steam_authentication_data, :json
  end
end
