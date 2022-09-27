class ReleaseTag < ApplicationRecord
  belongs_to :tag
  belongs_to :release
end
