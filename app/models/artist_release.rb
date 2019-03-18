# == Schema Information
#
# Table name: artist_releases
#
#  id         :bigint(8)        not null, primary key
#  artist_id  :bigint(8)
#  release_id :bigint(8)
#

class ArtistRelease < ApplicationRecord
  belongs_to :artist
  belongs_to :release
end
