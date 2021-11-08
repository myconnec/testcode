class UpdateCategoryItems < ActiveRecord::Migration
  def up
    Category.connection.execute("UPDATE categories SET name='Campus' WHERE name='campus';")
    Category.connection.execute("UPDATE categories SET name='Community' WHERE name='community';")
    Category.connection.execute("UPDATE categories SET name='Housing' WHERE name='housing';")
    Category.connection.execute("UPDATE categories SET name='H2F' WHERE name='h2f';")
    Category.connection.execute("UPDATE categories SET name='Free' WHERE name='free';")
    Category.connection.execute("UPDATE categories SET name='Jobs' WHERE name='jobs';")
    Category.connection.execute("UPDATE categories SET name='Sale' WHERE name='sale';")
    Category.connection.execute("UPDATE categories SET name='Services' WHERE name='services';")
    Category.connection.execute("UPDATE categories SET name='Unboxing' WHERE name='unboxing';")
  end

  def down
    Category.connection.execute("UPDATE categories SET name='campus' WHERE name='Campus';")
    Category.connection.execute("UPDATE categories SET name='community' WHERE name='Community';")
    Category.connection.execute("UPDATE categories SET name='housing' WHERE name='Housing';")
    Category.connection.execute("UPDATE categories SET name='h2f' WHERE name='H2F';")
    Category.connection.execute("UPDATE categories SET name='free' WHERE name='Free';")
    Category.connection.execute("UPDATE categories SET name='jobs' WHERE name='Jobs';")
    Category.connection.execute("UPDATE categories SET name='sale' WHERE name='Sale';")
    Category.connection.execute("UPDATE categories SET name='services' WHERE name='Services';")
    Category.connection.execute("UPDATE categories SET name='unboxing' WHERE name='Unboxing';")
  end
end