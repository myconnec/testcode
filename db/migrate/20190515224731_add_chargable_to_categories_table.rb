class AddChargableToCategoriesTable < ActiveRecord::Migration
  def change
    add_column :categories, :chargable, :integer, :limit => 11, :default => 0, :null => false
  end

  def down
    removea_column :categories, :chargable
  end
end
