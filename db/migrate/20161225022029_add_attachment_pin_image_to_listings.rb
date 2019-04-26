class AddAttachmentPinImageToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :media
    end
  end

  def self.down
    remove_attachment :listings, :media
  end
end
