# == Schema Information
#
# Table name: options
#
#  id                          :bigint(8)        not null, primary key
#  featured_date_window_before :integer
#  featured_date_window_after  :integer
#  name                        :string
#  data                        :binary
#

class Option < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
