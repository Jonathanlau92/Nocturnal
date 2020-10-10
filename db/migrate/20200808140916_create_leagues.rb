class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.string :title
      t.date :date
      t.decimal :price

      t.timestamps
    end
  end
end
