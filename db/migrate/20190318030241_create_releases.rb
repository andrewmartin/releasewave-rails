class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.integer :artist_id
      t.string :name
      t.text :description
      t.date :release_date

      t.timestamps
    end
  end
end
