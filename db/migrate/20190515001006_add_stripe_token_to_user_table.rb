class AddStripeTokenToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :stripe_token, :string, :limit => 32
  end

  def down
  end
end
