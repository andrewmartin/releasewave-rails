# == Schema Information
#
# Table name: shared_tags
#
#  id         :bigint(8)        not null, primary key
#  artist_id  :bigint(8)
#  release_id :bigint(8)
#  article_id :bigint(8)
#  tag_id     :integer
#

class SharedTag < ApplicationRecord
  belongs_to :tag
  belongs_to :artist, optional: true
  belongs_to :release, optional: true
  belongs_to :article, optional: true
end
