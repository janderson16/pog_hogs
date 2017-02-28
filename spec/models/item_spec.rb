require 'rails_helper'

describe Item do
  it "item can be created" do
    category = Category.create(title: "Pogs")
    item = category.items.create(title: "Official WPF Commemorative Pog", status: 0, price: 1.29)

    expect(item).to be_valid
  end

  it "category cannot created without valid attributes" do
    item = Item.create(title: "Official WPF Commemorative Pog", status: 0, price: 1.29)


    expect(item).to_not be_valid
  end

  it "category cannot created without valid attributes" do
    category = Category.create(title: "Pogs")
    item = category.items.create(title: "Official WPF Commemorative Pog", status: 0)

    expect(item).to_not be_valid
  end
end
