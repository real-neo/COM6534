class CreateRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :requirements do |t|
      t.string :tracking_number
      t.string :company_name
      t.string :email
      t.string :project_name
      t.string :project_details
      t.string :budget
      t.string :username

      t.timestamps
    end
  end
end
