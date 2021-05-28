class CreateStarredAidesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :starred_aides do |t|
      t.references :client, null: false, foreign_key: true
      t.references :aide, null: false, foreign_key: true
    end
  end
end
