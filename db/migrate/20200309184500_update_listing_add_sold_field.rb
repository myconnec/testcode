class UpdateListingAddSoldField < ActiveRecord::Migration
  def up
    add_column :listings, :sold, :int, :limit => 11, :null => true
  end

  def down
    remove_column :listings, :sold
  end
end
