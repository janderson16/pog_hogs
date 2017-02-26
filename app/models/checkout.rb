class Checkout
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def place_order(order)
    contents.each do |item_id, quantity|
      order.order_items.create(
        item_id: item_id.to_i,
        quantity: quantity
      )
    end
  end

end
