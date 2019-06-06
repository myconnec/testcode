# Source: https://gist.github.com/seyhunak/7843549
unless Rails.env.production?
    connection = ActiveRecord::Base.connection
    connection.tables.each do |table|
      connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
    end

    sql = File.read('./db/sql/database.sql')
    statements = sql.split(/;$/)
    statements.pop

    ActiveRecord::Base.transaction do
      statements.each do |statement|
        connection.execute(statement)
      end
    end
  end
