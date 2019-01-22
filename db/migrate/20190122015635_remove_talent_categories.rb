class RemoveTalentCategories < ActiveRecord::Migration

  class Subcategory < ActiveRecord::Base
  end

  class Category < ActiveRecord::Base
  end

  def up
    Subcategory.where(category_id: 7).destroy_all
    Category.where(id: 7).destroy_all
  end
end