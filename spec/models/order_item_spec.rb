require 'rails_helper'

describe OrderItem do
  it "order_item can be created" do
    user = User.create(email: "sam",
                       password: "pass",
                       role: 0)
    order = Order.create(status: 0, user_id: user.id)
    category = Category.create(title: "Pogs")
    item = category.items.create(title: "Official WPF Commemorative Pog", status: 0, price: 1.29)
    order_item = OrderItem.create(quantity: 1, item_id: item.id, order_id: order.id)

    expect(order_item).to be_valid
  end

  it "order_item cannot be created without necessary attributes" do
    user = User.create(email: "sam",
                       password: "pass",
                       role: 0)
    order = Order.create(status: 0, user_id: user.id)
    category = Category.create(title: "Pogs")
    item = category.items.create(title: "Official WPF Commemorative Pog", status: 0, price: 1.29)
    order_item = OrderItem.create(item_id: item.id, order_id: order.id)

    expect(order_item).to_not be_valid
  end
end
