class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.references :user, null: false
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
