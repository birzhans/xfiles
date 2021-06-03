class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :value, null: false
      t.references :aide, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.text :feedback
      t.timestamps
    end

    add_index :ratings, [:aide_id, :client_id], unique: true 
  end
end
