class AddXCoordinateToDesks < ActiveRecord::Migration[6.0]
  def change
    add_column :desks, :XCoordinate, :integer
  end
end
