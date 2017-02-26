class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :quantity, :order_id, :item_id, presence: true
end
