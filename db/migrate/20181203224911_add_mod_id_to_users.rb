class AddModIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mod_id, :string
  end
end
