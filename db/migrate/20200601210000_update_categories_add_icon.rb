class UpdateCategoriesAddIcon < ActiveRecord::Migration
  def up
    add_column :categories, :icon, :string, :null => true

    Category.connection.execute("UPDATE categories SET icon = 'education' WHERE id = 1;")
    Category.connection.execute("UPDATE categories SET icon = 'globe' WHERE id = 2;")
    Category.connection.execute("UPDATE categories SET icon = 'home' WHERE id = 3;")
    Category.connection.execute("UPDATE categories SET icon = 'search' WHERE id = 4;")
    Category.connection.execute("UPDATE categories SET icon = 'gift' WHERE id = 5;")
    Category.connection.execute("UPDATE categories SET icon = 'briefcase' WHERE id = 6;")
    Category.connection.execute("UPDATE categories SET icon = 'shopping-cart' WHERE id = 9;")
    Category.connection.execute("UPDATE categories SET icon = 'cog' WHERE id = 9;")
    Category.connection.execute("UPDATE categories SET icon = 'eye-open' WHERE id = 11;")
  end
  
  def down
    drop_column :categories, :icon
  end
end

