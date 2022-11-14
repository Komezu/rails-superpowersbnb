class ChangeDataTypeForListedInSuperpower < ActiveRecord::Migration[7.0]
  def change
    remove_column :superpowers, :listed
    add_column :superpowers, :listed, :boolean
  end
end
