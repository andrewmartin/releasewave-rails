class CreateReleaseEmbeds < ActiveRecord::Migration[5.2]
  def change
    create_table :release_embeds do |t|
      t.belongs_to :release, index: true
      t.belongs_to :embed, index: true

      t.timestamps
    end
  end
end

