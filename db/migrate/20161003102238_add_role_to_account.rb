class AddRoleToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :role, :integer
  end
end
