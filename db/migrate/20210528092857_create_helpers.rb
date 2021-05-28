class CreateHelpers < ActiveRecord::Migration[6.1]
  def change
    create_table :helpers do |t|
      t.string :name
      t.string :phone
      t.string :link

      t.timestamps
    end
  end
end
