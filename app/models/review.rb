# == Schema Information
#
# Table name: reviews
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  release_id :bigint(8)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  user_id    :integer
#  score      :string
#

class Review < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order(created_at: :desc) }

  belongs_to :release
  belongs_to :user

  def should_generate_new_friendly_id?
    name_changed?
  end
end
