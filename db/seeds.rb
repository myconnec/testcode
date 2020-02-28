# Source: https://gist.github.com/seyhunak/7843549
# DO NOT seed in RAILS production ENVs
unless Rails.env.production?
  # DB DUMP DROPS TABLES
  # connection = ActiveRecord::Base.connection
  # connection.tables.each do |table|
  #   connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
  # end

  results = ActiveRecord::Base.connection.execute("SELECT count(*) FROM categories;")
  if results == 0
    sql = File.read('./db/sql/database.sql')
    statements = sql.split(/;$/)
    statements.pop

    ActiveRecord::Base.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end
  end
end
