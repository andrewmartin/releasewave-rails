# == Schema Information
#
# Table name: artists
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  bandcamp           :string
#  facebook           :string
#  spotify            :string
#  soundcloud         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :bigint(8)
#  image_updated_at   :datetime
#  slug               :string
#  website            :string
#  youtube            :string
#  itunes             :string
#  twitter            :string
#  short_description  :text
#  instagram          :string
#

class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :orderByUpdated, -> { order(updated_at: :desc) }

  has_many :artist_releases
  has_many :releases, through: :artist_releases, dependent: :destroy

  has_and_belongs_to_many :tags

  has_attached_file :image, styles: {
                              thumb: "100x100>",
                              square: "200x200#",
                              medium: "300x300>",
                              large: "500x500#",
                            }

  validates_attachment_content_type :image, :content_type => [
                                              "image/jpg", "image/jpeg", "image/png", "image/gif",
                                            ]
  validates :name, presence: true, uniqueness: true

  def updateWithImage(params)
    if params[:image]
      picture_params = params[:image]
      data = params[:image][:data]
      filename = params[:image][:filename]

      image_file = Paperclip.io_adapters.for(data)
      image_file.original_filename = filename
      self.image = image_file
    end

    params = params.except(*[:image])
    self.update(params)
    self.save!
  end

  def self.search(search)
    if search
      Artist.where("LOWER(name) LIKE ?", "%#{search.downcase}%").order("id DESC")
    else
      Artist.all
    end
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
