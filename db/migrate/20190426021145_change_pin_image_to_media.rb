class ChangePinImageToMedia < ActiveRecord::Migration
  def change
    rename_column :listings, :pin_image_file_name, :media_filename
    rename_column :listings, :pin_image_content_type, :media_content_type
    rename_column :listings, :pin_image_file_size, :media_file_size
    rename_column :listings, :pin_image_updated_at, :media_updated_at
  end

  def down
    rename_column :listings, :media_filename, :pin_image_file_name
    rename_column :listings, :media_content_type, :pin_image_content_type
    rename_column :listings, :media_file_size, :pin_image_file_size
    rename_column :listings, :media_updated_at, :pin_image_updated_at
  end
end