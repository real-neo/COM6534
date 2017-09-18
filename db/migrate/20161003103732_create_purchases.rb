class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.references :account
      t.references :consumable
      t.integer :amount
      t.text :reason

      t.timestamps
    end
  end
end
