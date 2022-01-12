class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
