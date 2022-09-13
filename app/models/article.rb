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

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :orderByUpdated, -> { order(updated_at: :desc) }
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true

  has_many :tags

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
