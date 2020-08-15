class AddYCoordinateToDesks < ActiveRecord::Migration[6.0]
  def change
    add_column :desks, :YCoordinate, :integer
  end
end
