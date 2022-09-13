# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.search(search)
    if search
      Article.where("LOWER(name) LIKE ?", "%#{search.downcase}%").order("id DESC")
    else
      Article.all
    end
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
