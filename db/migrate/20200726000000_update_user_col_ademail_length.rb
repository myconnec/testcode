class UpdateUserColEmailLength < ActiveRecord::Migration
  def up
    change_column :users, :email, :string, :limit => 256
  end

  def down
    change_column :users, :email, :string, :limit => 32
  end
end
