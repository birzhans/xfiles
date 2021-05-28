class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.references :userable, null: false, polymorphic: true
      t.references :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
