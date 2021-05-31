class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.references :aide, null: false
      t.references :category, null: false
      t.string :description
      t.timestamps
    end
  end
end
