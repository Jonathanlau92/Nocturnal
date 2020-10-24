class AddHeroStatsToProfileImages < ActiveRecord::Migration[6.0]
  def change
    add_column :profile_images, :games_played, :integer
    add_column :profile_images, :win_rate, :decimal
    add_column :profile_images, :with_games, :integer
    add_column :profile_images, :with_win, :decimal
  end
end
