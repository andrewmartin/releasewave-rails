class CreateJoinTableReleaseArtist < ActiveRecord::Migration[5.2]
  def change
    create_join_table :releases, :artists do |t|
      t.index [:release_id, :artist_id]
      # t.index [:artist_id, :release_id]
    end
  end
end
