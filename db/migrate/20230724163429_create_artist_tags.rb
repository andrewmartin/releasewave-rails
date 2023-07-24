class CreateArtistTags < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_tags do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :tag, index: true
    end
  end
end
