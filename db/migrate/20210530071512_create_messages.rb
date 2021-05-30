class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.references :room, null: false, foreign_key: true
      t.references :userable, null: false, polymorphic: true

      t.timestamps
    end
  end
end
