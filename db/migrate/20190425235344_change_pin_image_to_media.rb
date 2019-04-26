class ChangePinImageToMedia < ActiveRecord::Migration
  def up
    rename_column :listings, :pin_image_file_name, :media_filename
  end

  def down
    rename_column :listings, :media_filename, :pin_image_file_name
  end
end
