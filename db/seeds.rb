# # if not data in database, allow seeding
# results = ActiveRecord::Base.connection.execute("SELECT count(*) FROM categories;")
# if results == 0
#   sql = File.read('./db/sql/database.sql')
#   statements = sql.split(/;$/)
#   statements.pop

#   ActiveRecord::Base.transaction do
#     statements.each do |statement|
#       connection.execute(statement)
#     end
#   end
# end
