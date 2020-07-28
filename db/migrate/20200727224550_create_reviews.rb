class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :rating
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :hospital, null: false, foreign_key: true
      t.belongs_to :healthsystem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
