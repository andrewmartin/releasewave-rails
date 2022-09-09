class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.integer :featured_date_window_before
      t.integer :featured_date_window_after
    end
  end
end
