require 'rails_helper'

RSpec.feature "User" do
  scenario "can write a review for an item and see it on the items page" do
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs)

      visit category_item_path(pogs, item)

      expect(page).to_not have_content("These pogs rule!!!")

      fill_in "review[body]", with: "These pogs rule!!!"
      click_on "Leave a Review"

      expect(page).to have_content("These pogs rule!!!")

  end
end
