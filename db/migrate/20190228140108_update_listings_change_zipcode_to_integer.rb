class UpdateListingsChangeZipcodeToInteger < ActiveRecord::Migration
  def change
    # change_column(table_name, column_name, type, options = {})
    change_column(:listings, :zipcode, :integer)
  end
end
