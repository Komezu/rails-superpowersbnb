class AddAddressToSuperpowers < ActiveRecord::Migration[7.0]
  def change
    add_column :superpowers, :address, :string
  end
end
