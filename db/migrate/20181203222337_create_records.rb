class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :username
      t.string :project_id

      t.timestamps
    end
  end
end
