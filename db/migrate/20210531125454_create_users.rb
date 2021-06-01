class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.integer :role, null: false
      t.string :phone
      t.string :bio

      t.timestamps
    end

    add_index :users, :username, unique: true
  end
end
