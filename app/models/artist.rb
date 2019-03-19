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
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string
#

class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :artist_releases
  has_many :releases, through: :artist_releases, dependent: :destroy

  # do_not_validate_attachment_file_type :image
  # validates :bandcamp, :format => URI::regexp(%w(http https))

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>',
    large: '500x500#'
  }

  validates_attachment_content_type :image, :content_type => [
    "image/jpg", "image/jpeg", "image/png", "image/gif"
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

    params = params.reject! { |k| k == 'image' }
    self.update(params)
    self.save!
  end

  def self.search(search)
    if search
      Artist.where('LOWER(name) LIKE ?', "%#{search.downcase}%").order('id DESC')
    else
      Artist.all
    end
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
