class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.attachment :file

      t.timestamps
    end
  end
end
