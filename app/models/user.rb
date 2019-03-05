class User < ApplicationRecord
  before_validation :set_active_package
  has_many :packages
  belongs_to :active_package, class_name: "Package"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def set_active_package
    if active_package.nil?
      self.active_package = Package.new(user: self)
    end
  end
end
