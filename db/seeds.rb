require 'faker'

Order.destroy_all
PackageItem.destroy_all
User.destroy_all
Package.destroy_all
IngredientList.destroy_all
Ingredient.destroy_all
Item.destroy_all

user = User.create!(email: "test2@gmail.com", password:"123456")
user1 = User.create!(email: "test3@gmail.com", password:"123456")
user2 = User.create!(email: "test4@gmail.com", password:"123456")
user2 = User.create!(email: "sam@lewagon.com", password:"123456")

# seed file below

require 'csv'

PRODUCT1 = Rails.root.join('db', 'seed_data', 'new1.csv')
PRODUCT2 = Rails.root.join('db', 'seed_data', 'new2.csv')

CSV_FILES = [PRODUCT2, PRODUCT1]

# Product model seeds
CSV_FILES.each do |file_name|
  puts "products"
  puts "#{file_name}"

  failures = []

  CSV.foreach(file_name, :headers => true) do |row|
puts row
    item = Item.new
    item.brand = row['brand'].capitalize
    item.name = row['product_name'].capitalize
    item.price = row['price'].capitalize
    item.product_category = row['product_category'].capitalize
    item.type_category = row['type_category'].capitalize
    item.picture_url = row['url']
    ingredients = row["ingredients"].split(",")

    ingredients.each do |ingredient|

      if Ingredient.where(name: ingredient).first
        link = IngredientList.new
        link.item = item
        link.ingredient = Ingredient.where(name: ingredient).first
        link.save

      else
        ing = Ingredient.new
        ing.name = ingredient
        ing.save
        link = IngredientList.new
        link.item = item
        link.ingredient = ing
        link.save
      end
    end


    successful = item.save
    if !successful
      failures << item
    end
  end
end
