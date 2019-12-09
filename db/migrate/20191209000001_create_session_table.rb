class CreateSessionTable < ActiveRecord::Migration
  def self.up
    create_table :sessions, :force => true do |t|
      t.string :id, null: false
      t.string :ip, null: false
      t.string :session, null: false
      t.timestamps :created_at, null: false
      t.timestamps :updated_att, null: true
    end
  end

  def self.down
    drop_table :sessions
  end
end
