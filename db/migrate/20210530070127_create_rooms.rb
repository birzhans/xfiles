class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :aide, null: false
      t.references :client, null: false
      t.timestamps
    end

    add_index :rooms, [:aide_id, :client_id], unique: true
  end
end
