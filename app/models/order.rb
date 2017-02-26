class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates :user_id, presence: true

  def total_price
    self.items.reduce(0) do |sum, item|
      sum += item.price
      sum
    end
  end

  def count
    self.items.count
  end

end
