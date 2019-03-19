# == Schema Information
#
# Table name: embeds
#
#  id         :bigint(8)        not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Embed < ApplicationRecord
  has_many :release_embeds
  has_many :releases, through: :release_embeds, dependent: :destroy
end
