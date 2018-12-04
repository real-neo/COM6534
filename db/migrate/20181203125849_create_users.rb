class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.belongs_to :mod, index: true
      t.boolean :admin
      t.string :mod_id

      t.timestamps
    end
  end
end
