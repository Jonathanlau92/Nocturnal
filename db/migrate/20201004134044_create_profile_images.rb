class CreateProfileImages < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_images do |t|
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
