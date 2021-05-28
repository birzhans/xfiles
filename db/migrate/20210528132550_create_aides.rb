class CreateAides < ActiveRecord::Migration[6.1]
  def change
    create_table :aides do |t|
      t.string :name, null: false
      t.string :phone
      t.string :link

      t.timestamps
    end
  end
end
