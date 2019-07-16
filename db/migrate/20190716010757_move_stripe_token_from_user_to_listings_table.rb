class MoveStripeTokenFromUserToListingsTable < ActiveRecord::Migration
  def up
    remove_column :users, :stripe_token, :string, :limit => 32
    add_column :listings, :stripe_token, :string, :limit => 32
  end

  def down
    add_column :users, :stripe_token, :string, :limit => 32
    remove_column :listings, :stripe_token, :string, :limit => 32
  end
end
