class UpdateCategoryAddChargableCategoryIdDeletedAt < ActiveRecord::Migration
  def up
    add_column :categories, :chargable, :integer, :null => true
    add_column :categories, :deleted_at, :integer, :null => true
    add_column :categories, :parent_id, :integer, :null => true
    
  end

  def down
    remove_column :categories, :chargable
    remove_column :categories, :deleted_at
    remove_column :categories, :parent_id
  end
end
