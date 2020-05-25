class UpdateSubcategoriesAddAutoParts < ActiveRecord::Migration
  def change
    Subcategory.create :name => "Auto Parts", :category_id => 9
  end

  def down
    Subcategory.delete :name => "Auto Parts", :category_id => 9
  end
end
