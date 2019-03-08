require 'faker'

PackageItem.destroy_all
User.destroy_all
Package.destroy_all
IngredientList.destroy_all
Ingredient.destroy_all
Item.destroy_all



user = User.create!(email: "test2@gmail.com", password:"123456")
user1 = User.create!(email: "test3@gmail.com", password:"123456")
user2 = User.create!(email: "test4@gmail.com", password:"123456")

# seed file below

# require 'csv'

# # ASIAN_BEAUTY1 = Rails.root.join('db', 'seed_data', 'AB1.csv')
# # ASIAN_BEAUTY2 = Rails.root.join('db', 'seed_data', 'AB2.csv')
# # PRODUCT1 = Rails.root.join('db', 'seed_data', 'Prod1.csv')
# PRODUCT2 = Rails.root.join('db', 'seed_data', 'Prod2.csv')
# RED1 = Rails.root.join('db', 'seed_data', 'red1.csv')

# CSV_FILES = [PRODUCT2, RED1]

# # Product model seeds
# CSV_FILES.each do |file_name|
#   puts "products"
#   puts "#{file_name}"

#   failures = []

#   CSV.foreach(file_name, :headers => true) do |row|

#     item = Item.new
#     item.brand = row['brand'].downcase

#     item.name = row['product_name'].downcase


#     ingredients = row[2..-1].join(',').downcase.split(",")

#     PROPERTY = ["oily", "dry", "sensitive", "antiaging"]

#     ingredients.each do |ingredient|

#       if Ingredient.where(name: ingredient).first
#         link = IngredientList.new
#         link.item = item
#         link.ingredient = Ingredient.where(name: ingredient).first
#         link.save
#         puts "true"
#       else
#         puts "false"

#         ing = Ingredient.new
#         ing.name = ingredient
#         ing.properties = PROPERTY.sample
#         ing.save

#         link = IngredientList.new
#         link.item = item
#         link.ingredient = ing
#         link.save
#       end
#     end


#     successful = item.save
#     if !successful
#       failures << item
#     end
#   end
# end

# Manual seed creater

# water = Ingredient.create! name: "Water", properties: "nil"
# retinA = Ingredient.create! name: "retin A.", properties: "antiaging, mild"

# kiehl_rare = Item.create! name: "Handcream", ingredients: [water, aloe, retinA], type: "moistersier"



Water = Ingredient.create! name: "Water", properties: "nil"
Kaolin
Bentonite
Propanediol
Glycerin
Titanium Dioxide
Caprylic
Capric Triglyceride,Cetearyl Alcohol
Zea Mays Starch
Corn Starch
Phenoxyethanol
Caprylyl Glycol
Xanthan Gum
Ethylhexylglycerin
Tocopherol
Lecithin
Aloe Barbadensis
Avena Sativa Flour
Oat Kernel Flour,Allantoin

# Tim deleted below

# # Ingredient model seeds
# all_ingredients = []
# failures = []

# CSV_FILES.each do |file_name|
#   puts "ingredients"
#   puts "#{file_name}"

#   CSV.foreach(file_name, :headers => true) do |row|
#     p_ingredients = row[2..-1].join(',')
#     p_ingredients = p_ingredients.split(",").map(&:strip)

#     p_ingredients.each do |ingredient|
#       all_ingredients << ingredient.downcase
#     end
#   end

#   all_ingredients = all_ingredients.uniq.sort
# end

# all_ingredients.each do |i|
#   new = Ingredient.new
#   new.ingredient = i

#   successful = new.save
#   if !successful
#     failures << new
#   end
# end
