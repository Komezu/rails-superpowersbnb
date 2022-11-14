class ChangeDataTypeForDescriptionInSuperpower < ActiveRecord::Migration[7.0]
  def change
    change_column :superpowers, :description, :text
  end
end
