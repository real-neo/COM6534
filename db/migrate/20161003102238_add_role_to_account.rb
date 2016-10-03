class AddRoleToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :role, :integer
  end
end
