class AddDataToOptions < ActiveRecord::Migration[5.2]
  def change
    add_column :options, :data, :binary
  end
end
