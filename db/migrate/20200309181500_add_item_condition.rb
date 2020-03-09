class AddItemCondition < ActiveRecord::Migration
  def up
    create_table :condtion do |t|
      t.string :value

      t.timestamps :created_at
      t.timestamps :updated_at
      t.timestamps :delete_at

      t.timestamps :created_by
      t.timestamps :updated_by
    end

    Condition.create :value => "Not Applicatable", :id => 1
    Condition.create :value => "Excellent", :id => 2
    Condition.create :value => "Good", :id => 3
    Condition.create :value => "Average", :id => 4
    Condition.create :value => "Poor", :id => 5
    Condition.create :value => "Terrible", :id => 6
  end

  def down
    drop_table :condtion
  end
end
