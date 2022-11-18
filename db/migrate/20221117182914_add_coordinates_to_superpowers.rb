class AddCoordinatesToSuperpowers < ActiveRecord::Migration[7.0]
  def change
    add_column :superpowers, :latitude, :float
    add_column :superpowers, :longitude, :float
  end
end
