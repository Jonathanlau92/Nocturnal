class AddPrizePoolToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :leagues, :prize_pool, :decimal
  end
end
