class AddInstagramToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :instagram, :string
  end
end
