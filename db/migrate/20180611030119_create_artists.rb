class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :bandcamp
      t.string :facebook
      t.string :spotify
      t.string :soundcloud

      t.timestamps
    end
  end
end
