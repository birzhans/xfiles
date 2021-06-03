class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :aide, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.integer :status, default: 0
      t.text :details, null: false

      t.timestamps
    end
  end
end
