class AddAttachmentImageToReleases < ActiveRecord::Migration[5.2]
  def self.up
    change_table :releases do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :releases, :image
  end
end
