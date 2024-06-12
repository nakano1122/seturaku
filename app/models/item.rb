class Item < ApplicationRecord
  belongs_to :user
  
  validates :item_name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :bought_at, presence: true
end
