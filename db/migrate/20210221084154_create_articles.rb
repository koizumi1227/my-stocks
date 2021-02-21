class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.string :description
      t.string :translated_title
      t.string :translated_description

      t.timestamps
    end
  end
end
