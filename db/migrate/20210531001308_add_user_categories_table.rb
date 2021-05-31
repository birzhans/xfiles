class AddUserCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :aide_categories do |t|
      t.references :aide, null: false
      t.references :category, null: false
      t.string :description

      t.timestamps
    end
  end
end
