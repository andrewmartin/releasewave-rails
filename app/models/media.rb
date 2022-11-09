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
