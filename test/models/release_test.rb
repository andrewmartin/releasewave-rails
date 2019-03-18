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

require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
