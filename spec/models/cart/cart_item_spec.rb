require 'rails_helper'

describe CartItem do
  it "returns the title of the item" do
    item = Item.new(title: "Item 1")
    cart_item = CartItem.new(item)

    expect(cart_item.title).to eq("Item 1")
  end

  it "returns the quantity for an item" do
    item = Item.new(title: "Item 1")
    cart_item = CartItem.new(item, 2)
    expect(cart_item.title).to eq("Item 1")
  end
end