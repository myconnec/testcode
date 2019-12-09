class Votersessions < ActiveRecord::Migration
  def up
    add_column :votes, :session_id, :string, :limit => 64, :null => true
  end

  def down
    remove_column :votes, :session_id
  end
end
