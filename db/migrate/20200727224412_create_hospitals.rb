class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.string :speciality
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
