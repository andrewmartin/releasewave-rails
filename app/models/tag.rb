# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  artist_id  :bigint(8)
#  release_id :bigint(8)
#  article_id :bigint(8)
#  slug       :string
#

class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :shared_tags
  has_many :artists, through: :shared_tags, source: :artist
  has_many :articles, through: :shared_tags, source: :article
  has_many :releases, through: :shared_tags, source: :release

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
