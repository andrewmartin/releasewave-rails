class AddTwitterYoutubeItunestoArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :youtube, :string
    add_column :artists, :itunes, :string
    add_column :artists, :twitter, :string
  end
end
