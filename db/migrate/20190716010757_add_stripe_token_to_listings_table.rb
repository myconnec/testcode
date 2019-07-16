class AddStripeTokenToListingsTable < ActiveRecord::Migration
  def up
    add_column :listings, :stripe_token, :string, :limit => 32
  end

  def down
    remove_column :listings, :stripe_token, :string, :limit => 32
  end
end
