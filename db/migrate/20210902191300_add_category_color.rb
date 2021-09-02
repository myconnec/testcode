class AddCategoryColor < ActiveRecord::Migration
  def up
    add_column :categories, :color, :string, :null => true

    Category.connection.execute("UPDATE categories SET color = '03A9F4' WHERE id = 1;")
    Category.connection.execute("UPDATE categories SET color = '26AE61' WHERE id = 2;")
    Category.connection.execute("UPDATE categories SET color = '048AF1' WHERE id = 3;")
    Category.connection.execute("UPDATE categories SET color = '7F27FB' WHERE id = 4;")
    Category.connection.execute("UPDATE categories SET color = '40E0CF' WHERE id = 5;")
    Category.connection.execute("UPDATE categories SET color = 'FF7F15' WHERE id = 6;")
    Category.connection.execute("UPDATE categories SET color = '1D65B4' WHERE id = 9;")
    Category.connection.execute("UPDATE categories SET color = 'AB47BC' WHERE id = 10;")
    Category.connection.execute("UPDATE categories SET color = 'f4c837' WHERE id = 11;")
  end

  def down
    remove_column :categories, :color
  end
end
