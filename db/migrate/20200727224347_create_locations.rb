class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :state
      t.string :city
      t.integer :zip
      t.belongs_to :healthsystem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
