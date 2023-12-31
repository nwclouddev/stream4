class CreateTitles < ActiveRecord::Migration[7.1]
  def change
    create_table :titles do |t|
      t.string :name
      t.string :desccription
      t.string :content_url
      t.string :thumbnail_url
      t.integer :year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
