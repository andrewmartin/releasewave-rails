class AddFeaturedToReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :featured, :boolean
  end
end
