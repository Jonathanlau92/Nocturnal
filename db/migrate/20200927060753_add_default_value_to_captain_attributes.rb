class AddDefaultValueToCaptainAttributes < ActiveRecord::Migration[6.0]
  def up
    change_column :users_teams, :captain, :boolean, default: false
  end

  def down
    change_column :users_teams, :captain, :boolean, default: nil
  end
end
