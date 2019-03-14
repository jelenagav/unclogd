class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items
  has_many :orders
  belongs_to :user
  attribute :quiz_results

  def self.new_from_quiz_results(quiz_results, price_range)
    # query = quiz_results.first

    skin_type = quiz_results["skin_type"]
    sensitivity = quiz_results["sensitivity"]
    concern = quiz_results["concern"]
    concern = ""


    item1 = Item.where(type_category: "Cleanser").where("product_category ILIKE :query", query: "%#{sensitivity}%").where("product_category ILIKE :query", query: "%#{skin_type}%").where("product_category ILIKE :query", query: "%#{concern}%").where(price: price_range.capitalize).first

    item2 = Item.where(type_category: "Moisturizer").where("product_category ILIKE :query", query: "%#{sensitivity}%").where("product_category ILIKE :query", query: "%#{skin_type}%").where("product_category ILIKE :query", query: "%#{concern}%").where(price: price_range.capitalize).first

    item3 = Item.where(type_category: "Serum").where("product_category ILIKE :query", query: "%#{sensitivity}%").where("product_category ILIKE :query", query: "%#{skin_type}%").where("product_category ILIKE :query", query: "%#{concern}%").where(price: price_range.capitalize).first

    item4 = Item.where(type_category: "Extrafoliator").where("product_category ILIKE :query", query: "%#{sensitivity}%").where("product_category ILIKE :query", query: "%#{skin_type}%").where("product_category ILIKE :query", query: "%#{concern}%").where(price: price_range.capitalize).first

    # item4 = Item.where(type_category: "eyecream").first

    items = [item1, item2, item3, item4].compact
    Package.new(items: items)
  end
  # Package.create_from_quiz_results
  # => <Package items=[<arr>]> where arr.count == 3
end
