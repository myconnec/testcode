class RemoveStripeTokenFromUserTable < ActiveRecord::Migration
  def up
    remove_column :users, :stripe_token
  end

  def down
    add_column :users, :stripe_token, :string, :limit => 32
  end
end