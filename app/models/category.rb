class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :discounts, as: :discountable
  has_many :discount_rules, through: :discounts

  validates_presence_of :name
  validates_uniqueness_of :name
end
