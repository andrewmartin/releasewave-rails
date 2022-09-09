class AddNameToOption < ActiveRecord::Migration[5.2]
  def change
    add_column :options, :name, :string, unique: true
  end
end
