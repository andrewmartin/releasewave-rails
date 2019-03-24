class AddShortDescriptionToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :short_description, :text
  end
end
