class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  validates :title, :description, :status, :price, presence: true
  validates :title, uniqueness: true
  enum status: [:active, :retired]
end
