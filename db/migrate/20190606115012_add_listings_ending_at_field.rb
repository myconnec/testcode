class AddListingsEndingAtField < ActiveRecord::Migration
  def change
    add_column :listings, :ending_at, :integer, :limit => 11, :default => Time.now.to_i, :null => false
    add_index :listings, :ending_at
  end

  def down
    removea_column :listings, :ending_at
    remove_index :listings, :ending_at
  end
end
