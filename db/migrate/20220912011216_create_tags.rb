class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name

      t.belongs_to :artist, index: true
      t.belongs_to :release, index: true
      t.belongs_to :article, index: true
    end
  end
end
