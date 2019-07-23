class AddInitialSubcategoriesPriceValues < ActiveRecord::Migration
  def up
    SubCategories.update_all("updated_at=created_at")

    SubCategories.where(status: 'invalid').find_each do |subCat|
      say "Updating subcategory: #{subcat.id}"
      subCat.update!(chargable: 10)
    end

    SubCategories.where(status: 'invalid').find_each do |subCat|
      say "Updating subcategory: #{subcat.id}"
      subCat.update!(chargable: 10)
    end

    SubCategories.where(status: 'invalid').find_each do |subCat|
      say "Updating subcategory: #{subcat.id}"
      subCat.update!(chargable: 10)
    end
  end

  def down
  end
end