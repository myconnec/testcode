class UpdateListingMediaFileNameColLength < ActiveRecord::Migration
  def up
    change_column :listings, :media_file_name, :string, :limit => 128
  end

  def down
    change_column :listings, :media_file_name, :string, :limit => 32
  end
end