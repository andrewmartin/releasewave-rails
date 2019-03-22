class AddWebsiteAndBuyToRelease < ActiveRecord::Migration[5.2]
  def change
    add_column :releases, :website, :string
    add_column :releases, :buy, :string
  end
end
