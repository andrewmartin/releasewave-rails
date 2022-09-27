class CreateSharedTag < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_tags do |t|
      t.belongs_to :artist, foreign_key: true, index: true
      t.belongs_to :release, foreign_key: true, index: true
      t.belongs_to :article, foreign_key: true, index: true
      t.integer :tag_id
    end
  end
end
