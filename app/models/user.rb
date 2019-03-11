class User < ApplicationRecord
  before_validation :set_active_package
  belongs_to :active_package, class_name: "Package", dependent: :destroy
  has_many :packages, dependent: :destroy
  has_many :orders, through: :packages, dependent: :destroy


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
