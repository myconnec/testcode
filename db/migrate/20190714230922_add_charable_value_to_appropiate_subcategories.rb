class AddCharableValueToAppropiateSubcategories < ActiveRecord::Migration
  def up
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 10 WHERE category_id = 3; # Housing")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 35 WHERE category_id = 6; # Job")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 10 WHERE category_id = 9 AND subcategories.id = 176; # Sales AND Automotive")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 10 WHERE category_id = 9 AND subcategories.id = 183; # Sales AND Automotive")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 5 WHERE category_id = 10;  # Services")
  end

  def down
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 0 WHERE category_id = 3; # Housing")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 0 WHERE category_id = 6; # Job")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 0 WHERE category_id = 9 AND subcategories.id = 176; #  Sales AND Automotive")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 0 WHERE category_id = 9 AND subcategories.id = 183; # Sales AND Automotive")
    Subcategory.connection.execute("UPDATE subcategories SET chargable = 0 WHERE category_id = 10;  # Services")
  end
end
