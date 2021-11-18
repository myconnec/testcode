class VersionTwoZeroZeroCategories < ActiveRecord::Migration

  class Category < ActiveRecord::Base
  end
  
  class Subcategory < ActiveRecord::Base
  end

  # There is no `up` and`down` from this migration. It is a one way operation
  def change

    # Truncate impressions, comments, listings, categories, subcategories
    ActiveRecord::Base.connection.execute("TRUNCATE impressions;")
    ActiveRecord::Base.connection.execute("TRUNCATE votes;")
    ActiveRecord::Base.connection.execute("TRUNCATE comments;")
    ActiveRecord::Base.connection.execute("TRUNCATE listings;")
    ActiveRecord::Base.connection.execute("TRUNCATE categories;")
    ActiveRecord::Base.connection.execute("TRUNCATE subcategories;")

    # source https://api.rubyonrails.org/classes/ActiveRecord/ModelSchema/ClassMethods.html#method-i-reset_column_information
    Category.reset_column_information
    Subcategory.reset_column_information

    # Add new content to category and subcategory tables
    # Categories
    Category.create :id => 1, :name => "Automotive", :icon => "fas fa-car", :color => "03A9F4"
    Category.create :id => 2, :name => "Electronics", :icon => "fas fa-laptop-house", :color => "40E0CF"
    Category.create :id => 3, :name => "Jobs", :icon => "fas fa-briefcase", :color => "1D65B4"
    Category.create :id => 4, :name => "Pets", :icon => "fas fa-paw", :color => "AB47BC"
    Category.create :id => 5, :name => "Real Estate", :icon => "fas fa-sign", :color => "f4c837"
    Category.create :id => 6, :name => "Services", :icon => "fas fa-tools", :color => "09c097"
    Category.create :id => 7, :name => "Beauty & Health", :icon => "fas fa-heartbeat", :color => "26AE61"
    Category.create :id => 8, :name => "Books, Music, Toys", :icon => "fas fa-book-open", :color => "048AF1"
    Category.create :id => 9, :name => "Clothing and Accessories", :icon => "fas fa-tshirt", :color => "7F27FB"
    Category.create :id => 10, :name => "Home and Garden", :icon => "fas fa-couch", :color => "FF7F15"
    Category.create :id => 11, :name => "Sports and Outdoors", :icon => "fas fa-quidditch", :color => "c56dfb"
    Category.create :id => 12, :name => "Weddings and Photographers", :icon => "fas fa-glass-cheers", :color => "57dc90"

    # Subcategories
    # Automotive
    Subcategory.create :category_id => 1, :name => "Cars & Trucks", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Motorcycles", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Campers & RVs", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Boats & Marine", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Power vehicles", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Trailers", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Commercial vehicles", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Times & Rims", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Auto Parts Store", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Transportation", :chargable => 0
    Subcategory.create :category_id => 1, :name => "Other Vehicles", :chargable => 0

    # Electronics
    Subcategory.create :category_id => 2, :name => "Audio & Speakers", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Cellphones & Accessories", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Camera & Accessories", :chargable => 0
    Subcategory.create :category_id => 2, :name => "TV/Media players", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Video games & Consoles", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Computer & Accessories", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Wearables", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Drones", :chargable => 0
    Subcategory.create :category_id => 2, :name => "VR Virtual Reality", :chargable => 0
    Subcategory.create :category_id => 2, :name => "RC Cars", :chargable => 0
    Subcategory.create :category_id => 2, :name => "Other Electronics", :chargable => 0

    # Jobs
    Subcategory.create :category_id => 3, :name => "Accounting", :chargable => 2500
    Subcategory.create :category_id => 3, :name => "Admin/Clerical", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Automotive", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Banking", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Biotech", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Business Development", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Business Opportunity", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Construction", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Consultant", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Customer Service", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Design", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Distribution/Shipping", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Education", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Engineering", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Entry Level", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "executive", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Facilities", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Finance", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Franchise", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "General Business", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "General Labor", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Government/Federal", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Grocery Stores", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Health Care", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Hospitality/Hotel", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Human Resources", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Journalism/Newspaper", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Information Technology", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Installation", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Insurance", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Inventory", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Legal", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Legal Admin", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Maintenance/Repair", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Management", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Manufacturing", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Marketing", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Media", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Nonprofit", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Nurse", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Other", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Pharmaceutical", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Procurement", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Professional Services", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Purchasing", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "QA/Quality Control", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Real Estate", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Research", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Restaurant", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Retail", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Sales", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Science", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Skilled Labor - Trades", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Social Services", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Strategy/Planning", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Supply Chain", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Telecommunications", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Training", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Transportation", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Veterinary Services", :chargable => 3500
    Subcategory.create :category_id => 3, :name => "Warehouse", :chargable => 3500

    # Pets
    Subcategory.create :category_id => 4, :name => "Birds", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Cats", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Dogs", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Fish", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Farm Animals  => ", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Collars, Harnesses and Leashes", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Reptiles", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Grooming", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Pet Sitters", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Crates & Kennels", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Feeds", :chargable => 0
    Subcategory.create :category_id => 4, :name => "Other Items", :chargable => 0

    # Real Estate
    Subcategory.create :category_id => 5, :name => "Apartments", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Commercial", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Homes", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Rentals", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Vacation", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Condos", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Farms", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Lands", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Ranches", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Manufactured Homes", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Townhomes", :chargable => 600
    Subcategory.create :category_id => 5, :name => "Other Real Estate", :chargable => 600

    # Services
    Subcategory.create :category_id => 6, :name => "Accountant", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Architecture", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Artists", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Barber", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Beauty Salons", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Building Remodeling", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Business Planner", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Taxicab/UBER/Ride Services", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Car Rental", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Chef", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Cleaning Services / Maids", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Home Decor", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Fitness Instructor", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Elderly Care", :chargable => 0
    Subcategory.create :category_id => 6, :name => "IT / Programmer", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Grant Writer", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Health Spa", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Lawn Care", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Legal Services", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Limousine", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Repair / Handyman", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Marketing Firm", :chargable => 0
    Subcategory.create :category_id => 6, :name => "nonprofit", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Home Security", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Structural Engineering", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Home Remodeling", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Auto Repair", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Tutoring/Education", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Website Designer", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Plumber", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Appliance Repair", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Dog Walker", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Pressure Washing", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Computer Repair", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Auto Insurance", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Small Construction", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Life Insurance", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Mortgage Refinance", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Photographers", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Financial Planner", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Music Dj & Bands", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Moving Company", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Dentist", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Doctors", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Party Bus", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Pawn Shops", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Gun Shops", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Laundromat", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Massage Therapists", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Garbage Collection", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Churches", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Pet Grooming", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Restaurants", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Pest Control Services", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Dumpster Rental", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Reception Halls", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Roofing Contractors", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Tow Truck Service", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Cash Services", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Tax services", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Funerals service", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Feal estate investor", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Real estate agents", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Grocery stores", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Retailers", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Food trucks/mobile food", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Internet firm", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Pain specialist/CBD Oils", :chargable => 0
    Subcategory.create :category_id => 6, :name => "Auto Parts", :chargable => 0

    # Beauty & Health
    Subcategory.create :category_id => 7, :name => "Hair Care", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Bath & Body", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Cosmetics", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Skincare", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Fragrance", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Personal care", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Gyms", :chargable => 0
    Subcategory.create :category_id => 7, :name => "Other Items", :chargable => 0

    # Books, Music, Toys
    Subcategory.create :category_id => 8, :name => "Toys", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Books", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Music", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Video Games", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Games & Puzzles", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Outdoor games & toys", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Power wheels", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Dolls", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Musical Instruments", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Trading Cards", :chargable => 0
    Subcategory.create :category_id => 8, :name => "RC Cars & Accessories", :chargable => 0
    Subcategory.create :category_id => 8, :name => "Other Items", :chargable => 0

    # Clothing and Accessories 
    Subcategory.create :category_id => 9, :name => "Woman’s Clothing", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Woman’s Shoes", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Men’s Clothing", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Men’s Shoes", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Kid’s Clothing", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Kid’s Shoes", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Baby Clothing", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Big and Tall Men’s", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Jewelry & Accessories", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Baby Accessories", :chargable => 0
    Subcategory.create :category_id => 9, :name => "Other Clothing", :chargable => 0

    # Home and Garden
    Subcategory.create :category_id => 10, :name => "Appliances", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Bathroom", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Furniture", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Home Goods", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Kitchen & Dining", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Tools & Machinery", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Lawn & Garden", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Home Décor", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Living Room", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Bedroom", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Lining", :chargable => 0
    Subcategory.create :category_id => 10, :name => "Other Items", :chargable => 0

    # Sports and Outdoors
    Subcategory.create :category_id => 11, :name => "Golf", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Football", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Bikes & Cycling", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Skateboarding", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Water ", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Camping & Hiking", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Lawn Care & Accessories", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Snow Equipment", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Fishing", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Baseball", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Basketball", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Boxing/ MMA", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Exercise Equipment", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Soccer", :chargable => 0
    Subcategory.create :category_id => 11, :name => "Other ", :chargable => 0

    # Weddings and Photographers 
    Subcategory.create :category_id => 12, :name => "Gifts", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Photographers", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Churches", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Venues", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Jewelry", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Planners/Promoter", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Clothing/Designers/Shoes", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Hair & Makeup", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Rentals", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Flower Shops", :chargable => 0
    Subcategory.create :category_id => 12, :name => "Other Items", :chargable => 0
  end
end
