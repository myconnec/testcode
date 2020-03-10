class AddItemCondition < ActiveRecord::Migration
  def up
    create_table :conditions do |t|
      t.string :value
      t.timestamps
    end

    Condition.create :value => "Not Applicatable", :id => 1
    Condition.create :value => "Excellent", :id => 2
    Condition.create :value => "Good", :id => 3
    Condition.create :value => "Average", :id => 4
    Condition.create :value => "Poor", :id => 5
    Condition.create :value => "Terrible", :id => 6

    add_column :listings, :condition_id, :integer, :limit => 1, :null => true, default: 0
  end

  def down
    drop_table :conditions
    remove_column :listings, :condition
  end
end
