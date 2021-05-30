class AddUsernames < ActiveRecord::Migration[6.1]
  def change
    add_column :aides, :username, :string, null: false
    add_column :clients, :username, :string, null: false

    add_index :aides, :username, unique: true
    add_index :clients, :username, unique: true
  end
end
