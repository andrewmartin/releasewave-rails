class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :type
      t.text :content

      t.belongs_to :artist, index: true
      t.timestamps
    end
  end
end
