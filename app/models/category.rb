class Category < ActiveRecord::Base
  has_many :listings
  has_many :subcategories
end