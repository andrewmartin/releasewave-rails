class ArtistTag < ApplicationRecord
  belongs_to :tag
  belongs_to :artist
end
