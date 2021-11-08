class UpdateCategoryIcons < ActiveRecord::Migration
  def up
    Category.connection.execute("UPDATE categories SET icon = 'school' WHERE id = 1;")
    Category.connection.execute("UPDATE categories SET icon = 'box-open' WHERE id = 11;")
  end

  def down
    Category.connection.execute("UPDATE categories SET icon = 'education' WHERE id = 1;")
    Category.connection.execute("UPDATE categories SET icon = 'null' WHERE id = 11;")
  end
end
