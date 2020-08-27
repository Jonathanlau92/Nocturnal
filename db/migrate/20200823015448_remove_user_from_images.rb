class RemoveUserFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :images, :user, null: false, foreign_key: true
  end
end
