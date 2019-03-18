class AddSlugToReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :slug, :string
    add_index :releases, :slug, unique: true
  end
end
