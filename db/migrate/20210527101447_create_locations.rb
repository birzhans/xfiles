class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :address
      t.belongs_to :user, null: false
      t.belongs_to :city, null: false
      t.timestamps
    end
  end
end
