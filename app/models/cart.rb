class Cart
  attr_reader :contents, :cart_items

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

  def cart_items
    #creates a hash of item objects and their quantity
    #can pass to the controller
    @contents.each do |id, quantity|
      @cart_items[Item.find(id)] = quantity
    end
    @cart_items
  end

  def update_cart_items(quantity)
    #passes a hash
    contents[item_id.to_s] = quantity
  end

  def add_items_to_cart
    #can take new input from params for the item id and 
    #add it to the existing contents hash
  end

  def total
    sum = 0
    @cart_items.each do |item, quantity|
      sum += (item.price * quantity)
    end
    sum
  end



end
