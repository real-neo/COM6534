class DeleteTrackingNumber < ActiveRecord::Migration[5.2]
  def change
    remove_column :requirements, :tracking_number, :string
    add_column :requirements, :state, :string, default:'waiting'
  end
end
