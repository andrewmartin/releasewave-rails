class RemoveWebsiteFromRelease < ActiveRecord::Migration[5.2]
  def change
    remove_column :releases, :website, :string
  end
end
