class AddAttachmentPinImageToListings < ActiveRecord::Migration
  def self.up
    change_table :listings do |t|
      t.attachment :pin_image
    end
  end

  def self.down
    remove_attachment :listings, :pin_image
  end
end
