class AddChargableToSubcategoryTable < ActiveRecord::Migration
  def change
    add_column :subcategories, :chargable, :integer, :limit => 11, :default => 0, :null => false
    add_index :subcategories, [:chargable], :name => "subcategories_charable_index", :unique => false, :length => {:message => 11 }
  end

  def down
    removea_column :subcategories, :chargable
  end
end
