class InitialSchema < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    t.string :name
    t.string :icon
    end

    create_table :subcategories do |t|
    t.string :name
    t.integer :category_id
    end

    create_table :listings do |t|
    t.string :title
    t.text :description
    t.string :city
    t.string :state
    t.string :zipcode
    t.string :price
    t.string :address1
    t.string :address2
    t.string :ademail
    t.timestamps
    end
  end
end
