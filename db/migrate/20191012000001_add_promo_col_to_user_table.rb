class AddPromoColToUserTable < ActiveRecord::Migration
  def change
    add_column :listings, :promo_1, :integer, :limit => 1, :default => 3, :null => false
    add_index :listings, :promo_1
  end

  def down
    remove_column :listings, :promo_1
    remove_index :listings, :promo_1
  end
end
