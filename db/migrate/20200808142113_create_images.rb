class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :image_category
      t.string :name

      t.timestamps
    end
  end
end
