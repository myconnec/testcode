class UpdateUsersAddAgreement < ActiveRecord::Migration
  def up
    add_column :users, :agreement, :int1, :null => false, :default => 0
  end

  def down
    remove_column :users, :agreement
  end
end
