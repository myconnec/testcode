class UpdateSubcategoriesAddMoreServices < ActiveRecord::Migration
  def change
    # Caused by: NoMethodError: undefined method `chargable=' for #<Subcategory id: nil, name: "tax services", category_id: 10>
    # Subcategory.create :name => "tax services", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "funerals service", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "real estate investor", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "real estate agents", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "grocery stores", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "retailers", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "food trucks/mobile food", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "internet firm", :category_id => 10, :chargable => 0
    # Subcategory.create :name => "pain specialist", :category_id => 10, :chargable => 0

    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('tax service', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('funerals servic', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('real estate investor', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('real estate agents', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('grocery stores', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('retailers', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('food trucks/mobile food', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('internet firm', 10, 0);")
    Subcategory.connection.execute("INSERT INTO subcategories (name, category_id, chargable) VALUES('pain specialist', 10, 0);")
  end

  def down
    Subcategory.delete :name => "tax services"
    Subcategory.delete :name => "funerals service"
    Subcategory.delete :name => "real estate investor"
    Subcategory.delete :name => "real estate agents"
    Subcategory.delete :name => "grocery stores"
    Subcategory.delete :name => "retailers"
    Subcategory.delete :name => "food trucks/mobile food"
    Subcategory.delete :name => "internet firm"
    Subcategory.delete :name => "pain specialist"
  end
end
