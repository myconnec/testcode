class UpdateCategoryAddDeletedAt < ActiveRecord::Migration
  def up
    add_column :categories, :deleted_at, :integer, :null => true
  end

  def down
    remove_column :categories, :deleted_at
  end
end
