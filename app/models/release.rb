# == Schema Information
#
# Table name: releases
#
#  id                 :bigint(8)        not null, primary key
#  artist_id          :integer
#  name               :string
#  description        :text
#  release_date       :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Release < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :artist_releases
  has_many :artists, through: :artist_releases, dependent: :destroy

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
      data = params[:image][:data]
      filename = params[:image][:filename]

      image_file = Paperclip.io_adapters.for(data)
      image_file.original_filename = filename
      self.image = image_file
    end

    params = params.reject! { |k| k == 'image' }
    self.update(params)
    if self.new_record?
      self.save!
    end

    if params[:artist_ids]
      self.artist_releases.destroy_all
      params[:artist_ids].each do |artist_id|
        self.artist_releases.create(artist_id: artist_id)
      end
      self.save!
    end
  end

  def self.search(search)
    if search
      Release.where('LOWER(name) LIKE ?', "%#{search.downcase}%").order('id DESC')
    else
      Release.all
    end
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
