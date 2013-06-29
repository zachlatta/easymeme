class AddAttachmentImageToMemes < ActiveRecord::Migration
  def self.up
    change_table :memes do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :memes, :image
  end
end
