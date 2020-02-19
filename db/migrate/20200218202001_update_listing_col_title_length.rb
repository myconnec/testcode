class UpdateListingColTitleLength < ActiveRecord::Migration
  def up
    change_column :listings, :title, :string, :limit => 256
  end

  def down
    change_column :listings, :title, :string, :limit => 128
  end
end
