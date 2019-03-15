class AddNameIndexUniqueToArtist < ActiveRecord::Migration[5.2]
  def change
    change_table :artists do |t|
      t.index :name, unique: true
    end
  end
end
