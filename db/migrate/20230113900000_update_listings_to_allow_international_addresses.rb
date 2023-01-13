class UpdateListingsToAllowInternationalAddresses < ActiveRecord::Migration
  def up
    change_column :listings, :state, :string, :limit => 32
    change_column :listings, :zipcode, :string, :limit => 32
  end

  def down
    change_column :listings, :state, :string, :limit => 2
    change_column :listings, :zipcode, :string, :limit => 5
  end
end
