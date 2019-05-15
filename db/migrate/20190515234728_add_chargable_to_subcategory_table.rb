class AddChargableToSubcategoryTable < ActiveRecord::Migration
  def change
    add_column :subcategories, :chargable, :integer, :limit => 11, :default => 0, :null => false
  end

  def down
    removea_column :subcategories, :chargable
  end
end
