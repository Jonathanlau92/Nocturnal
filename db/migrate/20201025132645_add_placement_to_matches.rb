class AddPlacementToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :round, :integer
    add_column :matches, :position, :integer
  end
end
