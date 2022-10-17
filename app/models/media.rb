class Media < ApplicationRecord
  has_one_base64_attached :image

  scope :byPage, ->(perPage, page) {
          paginate(per_page: perPage, page: page)
        }
end
