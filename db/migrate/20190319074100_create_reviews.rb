class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.belongs_to :release, index: true
      t.text :content

      t.timestamps
    end
  end
end
