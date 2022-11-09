class AddCaptionToMedium < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :caption, :string
  end
end
