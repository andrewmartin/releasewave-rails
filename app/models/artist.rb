# == Schema Information
#
# Table name: artists
#
#  id                 :integer          not null, primary key
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
#

class Artist < ApplicationRecord
  # TODO: infra
  # sudo apt-get install imagemagick

  # do_not_validate_attachment_file_type :image

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

end
