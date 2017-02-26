require 'rails_helper'

describe Order do
  it "order can be created" do
    user = User.create(email: "sam",
                       password: "pass",
                       role: 0)
    order = Order.create(status: 0, user_id: user.id)


    expect(order).to be_valid
  end

  it "order cannot be created without necessary attributes" do
    order = Order.create(status: 0)


    expect(order).to_not be_valid
  end
end
