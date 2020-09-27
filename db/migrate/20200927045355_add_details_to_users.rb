class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_picture, :string
    add_column :users, :cover_photo, :string
    add_column :users, :country, :string
    add_column :users, :age, :integer
    add_column :users, :position, :integer
  end
end
