# source https://blog.kiprosh.com/how-to-store-emoji-characters-with-ruby-on-rails-and-mysql/
class ChangeDbCollationToUtf8mb4 < ActiveRecord::Migration

  # helper functions
  def db
    ActiveRecord::Base.connection
  end

  def alter_column_to_utf8mb(table, column)
    default = column.default.blank? ? '' : "DEFAULT '#{column.default}'"
    null = column.null ? '' : 'NOT NULL'
    execute "ALTER TABLE `#{table}` MODIFY `#{column.name}` #{column.sql_type.upcase}
      CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci #{default} #{null};"
  end

  def alter_column_to_latin1(table, column)
    default = column.default.blank? ? '' : "DEFAULT '#{column.default}'"
    null = column.null ? '' : 'NOT NULL'
    execute "ALTER TABLE `#{table}` MODIFY `#{column.name}` #{column.sql_type.upcase}
      CHARACTER SET latin1 COLLATE latin1 #{default} #{null};"
  end

    # migration functions

  def up
    execute "ALTER DATABASE `#{db.current_database}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

    db.tables.each do |table|
      execute "ALTER TABLE `#{table}` ROW_FORMAT=DYNAMIC CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

      db.columns(table).each do |column|
        case column.sql_type
        when /([a-z]*)text/i
          alter_column_to_utf8mb(table, column)
        when /varchar\(([0-9]+)\)/i
          alter_column_to_utf8mb(table, column)
        end
      end
    end
  end

  def down
    execute "ALTER DATABASE `#{db.current_database}` CHARACTER SET latin1 COLLATE latin1;"

    db.tables.each do |table|
      execute "ALTER TABLE `#{table}` ROW_FORMAT=DYNAMIC CHARACTER SET latin1 COLLATE latin1;"

      db.columns(table).each do |column|
        case column.sql_type
        when /([a-z]*)text/i
          alter_column_to_latin1(table, column)
        when /varchar\(([0-9]+)\)/i
          alter_column_to_latin1(table, column)
        end
      end
    end
  end
end
