class AddShortDescriptionToReleases < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :short_description, :text
  end
end
