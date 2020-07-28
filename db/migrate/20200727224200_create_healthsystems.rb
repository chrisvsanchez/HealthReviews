class CreateHealthsystems < ActiveRecord::Migration[6.0]
  def change
    create_table :healthsystems do |t|
      t.string :name

      t.timestamps
    end
  end
end
