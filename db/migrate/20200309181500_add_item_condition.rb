class AddItemCondition < ActiveRecord::Migration
  def up
    create_table :condtion do |t|
      t.string :value

      t.timestamps


      t.int :created_by
      t.int :updated_by
    end

    Condition.create :value => "Not Applicatable", :id => 1
    Condition.create :value => "Excellent", :id => 2
    Condition.create :value => "Good", :id => 3
    Condition.create :value => "Average", :id => 4
    Condition.create :value => "Poor", :id => 5
    Condition.create :value => "Terrible", :id => 6

    add_column :listings, :condition, :int, :limit => 1, :null => true, default: 0
  end

  def down
    drop_table :condtion
    remove_column :listings, :condition
  end
end
