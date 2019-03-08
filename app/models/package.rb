class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items
  belongs_to :user
  attribute :quiz_results

  def self.new_from_quiz_results(quiz_results)
    items = Item.all.limit(3)
    Package.new(items: items)
  end
  # Package.create_from_quiz_results
  # => <Package items=[<arr>]> where arr.count == 3
end
