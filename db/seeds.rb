require 'faker'

Item.destroy_all
User.destroy_all
Package.destroy_all
PackageItem.destroy_all


user = User.create!(email: "test2@gmail.com", password:"123456")
user1 = User.create!(email: "test3@gmail.com", password:"123456")
user2 = User.create!(email: "test4@gmail.com", password:"123456")

Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://prodimage.images-bn.com/pimages/9780156628709_p0_v7_s550x406.jpg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://hpmedia.bloomsbury.com/rep/s/9781408855904_309575.jpeg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://images.gr-assets.com/books/1515589515l/186074.jpg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://images-na.ssl-images-amazon.com/images/I/51v1aAlA9xL._SX318_BO1,204,203,200_.jpg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://hpmedia.bloomsbury.com/rep/s/9781408855683_309032.jpeg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://images.gr-assets.com/books/1515589515l/186074.jpg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://kbimages1-a.akamaihd.net/3923e3c0-2296-4f4f-96a4-69700eca44f5/1200/1200/False/harry-potter-and-the-sorcerer-s-stone-the-first-book-in-the-phenomenal-internationally-bestselling-harry-potter-series-by-j-k-rowling.jpg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://prodimage.images-bn.com/pimages/9781338299144_p0_v4_s550x406.jpg")
Item.create!(name: Faker::Games::Zelda.unique.item, picture_url: "https://upload.wikimedia.org/wikipedia/en/thumb/6/6b/Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg/220px-Harry_Potter_and_the_Philosopher%27s_Stone_Book_Cover.jpg")
