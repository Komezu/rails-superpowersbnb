class CreateSuperpowers < ActiveRecord::Migration[7.0]
  def change
    create_table :superpowers do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :listed
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
