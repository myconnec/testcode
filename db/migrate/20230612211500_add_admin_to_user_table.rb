# source https://blog.kiprosh.com/how-to-store-emoji-characters-with-ruby-on-rails-and-mysql/
class AddAdminToUserTable < ActiveRecord::Migration

  def up
    add_column :users, :admin, :bool, default: false
  end

  def down
    remove_column :users, :admin
  end
end
