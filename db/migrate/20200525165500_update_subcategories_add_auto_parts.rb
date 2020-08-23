class UpdateSubcategoriesAddAutoParts < ActiveRecord::Migration
  def change
    # Caused by: NoMethodError: undefined method `chargable=' for #<Subcategory id: nil, name: "tax services", category_id: 10>
    # Subcategory.create :name => "Auto Parts", :category_id => 9, :chargable => 0
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('Auto Parts', 10, 0);")
  end

  def down
    Subcategory.delete :name => "Auto Parts"
  end
end
