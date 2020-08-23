class UpdateSubcategoriesAddMoreServices < ActiveRecord::Migration
  def change
    Subcategory.create :name => "tax services", :category_id => 10, :chargable => 0
    Subcategory.create :name => "funerals service", :category_id => 10, :chargable => 0
    Subcategory.create :name => "real estate investor", :category_id => 10, :chargable => 0
    Subcategory.create :name => "real estate agents", :category_id => 10, :chargable => 0
    Subcategory.create :name => "grocery stores", :category_id => 10, :chargable => 0
    Subcategory.create :name => "retailers", :category_id => 10, :chargable => 0
    Subcategory.create :name => "food trucks/mobile food", :category_id => 10, :chargable => 0
    Subcategory.create :name => "internet firm", :category_id => 10, :chargable => 0
    Subcategory.create :name => "pain specialist", :category_id => 10, :chargable => 0
  end

  def down
    Subcategory.delete :name => "tax services", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "funerals service", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "real estate investor", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "real estate agents", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "grocery stores", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "retailers", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "food trucks/mobile food", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "internet firm", :category_id => 10, :chargable => 0
    Subcategory.delete :name => "pain specialist", :category_id => 10, :chargable => 0
  end
end
