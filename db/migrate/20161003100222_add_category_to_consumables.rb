class AddCategoryToConsumables < ActiveRecord::Migration[5.1]
  def change
    add_column :consumables, :category, :integer
  end
end
