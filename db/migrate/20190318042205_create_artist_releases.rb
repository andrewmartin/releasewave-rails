class CreateArtistReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_releases do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :release, index: true
    end
  end
end
