class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
    @cart_items = {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def update_cart_items(quantity)
    contents[item_id.to_s] = quantity.abs
  end

  def items
    @contents.map do |id, quantity|
      item = Item.find(id)
      CartItem.new(item, quantity.abs)
    end
  end

  def total
    sum = 0
    items.each do |item|
      sum += (item.price * item.quantity)
    end
    sum.round(2)
  end

end
