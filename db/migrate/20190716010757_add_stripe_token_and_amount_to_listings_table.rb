class AddStripeTokenAndAmountToListingsTable < ActiveRecord::Migration
  def up
    add_column :listings, :stripe_token, :string, :limit => 32
    add_column :listings, :stipe_amount, :int, :limit => 11
  end

  def down
    remove_column :listings, :stripe_token
    remove_column :listings, :stripe_amount
  end
end
