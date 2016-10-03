class AddCategoryToConsumables < ActiveRecord::Migration[5.0]
  def change
    add_column :consumables, :category, :integer
  end
end
