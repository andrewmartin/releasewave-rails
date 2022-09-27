# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true, uniqueness: true

  scope :orderByUpdated, -> { order(updated_at: :desc) }
  validates :content, presence: true

#   has_many :tags, through: :shared_tags, source: :article, foreign_key: :tag_id

  def self.search(search)
    if search
      Article.where("LOWER(name) LIKE ?", "%#{search.downcase}%").order("id DESC")
    else
      Article.all
    end
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
