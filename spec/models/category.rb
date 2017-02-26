require 'rails_helper'

describe Category do
  it "category can be created" do
    category = Category.create(title: "Pogs")


    expect(category).to be_valid
  end

  it "category cannot be duplicated" do
    category = Category.create(title: "Pogs")
    category_2 = Category.create(title: "Pogs")


    expect(category_2).to_not be_valid
  end
end
