# support utf8mb4, specifically for emoji support
# source https://blog.kiprosh.com/how-to-store-emoji-characters-with-ruby-on-rails-and-mysql/

require 'active_record/connection_adapters/abstract_mysql_adapter'

module ActiveRecord
  module ConnectionAdapters
    class AbstractMysqlAdapter
      NATIVE_DATABASE_TYPES[:string] = { name: 'varchar', limit: 191 }
    end
  end
end
