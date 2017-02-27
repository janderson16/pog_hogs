class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates :user_id, presence: true
  enum status: [:ordered, :paid, :completed, :cancelled]

  def total_price
    self.items.reduce(0) do |sum, item|
      sum += item.price
      sum.round(2)
    end
  end

  def count
    self.items.count
  end

  # def current_status
  #   if status == 0
  #     "Ordered"
  #   elsif status == 1
  #     "Paid"
  #   elsif status == 2
  #     "Completed"
  #   else status == 3
  #     "Cancelled"
  #   end
  # end

  def update_at
    if status == "completed" || status == "cancelled"
       "Order was #{status} at #{updated_at.strftime("%l:%M%P, %d %b. %Y")}"
    else
      nil
    end
  end
end
