class AddScoreToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :score, :string
  end
end
