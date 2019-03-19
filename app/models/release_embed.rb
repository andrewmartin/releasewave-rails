# == Schema Information
#
# Table name: release_embeds
#
#  id         :bigint(8)        not null, primary key
#  release_id :bigint(8)
#  embed_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReleaseEmbed < ApplicationRecord
  belongs_to :embed
  belongs_to :release
end
