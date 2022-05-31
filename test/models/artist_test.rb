# == Schema Information
#
# Table name: artists
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  bandcamp           :string
#  facebook           :string
#  spotify            :string
#  soundcloud         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :bigint(8)
#  image_updated_at   :datetime
#  slug               :string
#  website            :string
#  youtube            :string
#  itunes             :string
#  twitter            :string
#  short_description  :text
#  instagram          :string
#

require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
