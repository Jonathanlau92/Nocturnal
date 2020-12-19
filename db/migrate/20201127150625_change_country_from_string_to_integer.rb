class ChangeCountryFromStringToInteger < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :country
    add_column :users, :country, :integer
  end

  def down
    remove_column :users, :country
    add_column :users, :country, :string
  end
end
