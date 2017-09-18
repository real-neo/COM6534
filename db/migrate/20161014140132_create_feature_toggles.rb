class CreateFeatureToggles < ActiveRecord::Migration[5.1]
  def change
    create_table :feature_toggles do |t|
      t.string :identifier
      t.string :name
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
