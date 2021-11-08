class UpdateListingAddChargedCol < ActiveRecord::Migration
  def up
    add_column :listings, :charge_amount, :int, :limit => 11, :null => true, default: 0
    add_column :listings, :charge_complete, :int, :limit => 1, :null => true, default: 0
  end

  def down
    remove_column :listings, :charge_amount
    remove_column :listings, :charge_complete
  end
end