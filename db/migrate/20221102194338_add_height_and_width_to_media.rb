class AddHeightAndWidthToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :height, :integer
    add_column :media, :width, :integer
  end
end
