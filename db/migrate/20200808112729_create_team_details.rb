class CreateTeamDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :team_details do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :captain

      t.timestamps
    end
  end
end
