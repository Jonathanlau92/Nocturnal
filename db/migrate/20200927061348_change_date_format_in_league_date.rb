class ChangeDateFormatInLeagueDate < ActiveRecord::Migration[6.0]
  def up
    change_column :leagues, :date, :datetime
  end

  def down
    change_column :leagues, :date, :date
  end
end
