# == Schema Information
#
# Table name: media
#
#  id                :bigint(8)        not null, primary key
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :bigint(8)
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  height            :integer
#  width             :integer
#  caption           :string
#

# TODO:
# add "used" boolean to indicatei it was selected and prevent subsequent deletes
# figure out how to generate and return the URL on create

class Media < ApplicationRecord
  has_one_base64_attached :image
  after_commit :set_dimensions, on: :create
  validates :caption, presence: true

  scope :byPage, ->(perPage, page) {
          paginate(per_page: perPage, page: page)
        }

  def width
    image.metadata["width"]
  end

  def height
    image.metadata["height"]
  end

  def set_dimensions
    meta = ActiveStorage::Analyzer::ImageAnalyzer.new(image).metadata
    self.height = meta[:height] || 0
    self.width = meta[:width] || 0
    save!
  end
end
