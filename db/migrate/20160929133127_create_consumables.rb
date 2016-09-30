class CreateConsumables < ActiveRecord::Migration[5.0]
  def change
    create_table :consumables do |t|
      t.string :name
      t.string :description
      t.integer :stock_level
      t.integer :min_stock_level

      t.timestamps
    end
  end
end
