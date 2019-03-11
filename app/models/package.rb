class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items
  has_many :orders
  belongs_to :user
  attribute :quiz_results

  def self.new_from_quiz_results(quiz_results)
    # query = quiz_results.first

    sensitivity = quiz_results["sensitivity"]
    items = Item.where("product_category ILIKE :query", query: "#{sensitivity}%")
    items = Item.all.limit(4)
    Package.new(items: items)
  end
  # Package.create_from_quiz_results
  # => <Package items=[<arr>]> where arr.count == 3
end
