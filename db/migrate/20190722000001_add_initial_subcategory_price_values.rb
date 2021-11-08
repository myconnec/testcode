class AddInitialSubcategoryPriceValues < ActiveRecord::Migration
  def up
    # Job Postings (cat_id 6) 3500 cent USD
    Subcategory.where(category_id: 6).find_each do |subCat|
      subCat.update!(chargable: 3500)
    end

    # Housing Postings (cat_id 3) 1000 cent USD
    Subcategory.where(category_id: 3).find_each do |subCat|
      subCat.update!(chargable: 1000)
    end

    # Services Postings (cat_id 10) 500 cent USD
    Subcategory.where(category_id: 10).find_each do |subCat|
      subCat.update!(chargable: 500)
    end

    # Sales (Automotive, Tickets) sub_cat_id 176 and 183 1000 cent USD
    Subcategory.where(id: 176).find_each do |subCat|
      subCat.update!(chargable: 1000)
    end
    Subcategory.where(id: 183).find_each do |subCat|
      subCat.update!(chargable: 1000)
    end
  end

  def down
    # Reset all chargable values to 0
    Subcategory.find_each do |subCat|
      subCat.update!(chargable: 0)
    end
  end
end