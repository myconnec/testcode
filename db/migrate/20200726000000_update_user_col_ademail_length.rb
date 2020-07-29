class UpdateUserColAdemailLength < ActiveRecord::Migration
  def up
    change_column :users, :ademail, :string, :limit => 256
  end

  def down
    change_column :users, :ademail, :string, :limit => 32
  end
end
