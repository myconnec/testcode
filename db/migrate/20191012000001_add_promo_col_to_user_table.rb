class AddPromoColToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :promo_1, :integer, :limit => 1, :default => 3, :null => false
    add_index :users, :promo_1
  end

  def down
    remove_column :users, :promo_1
    remove_index :users, :promo_1
  end
end
