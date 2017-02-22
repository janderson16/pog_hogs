require 'rails_helper'

  describe "Visitor can view items" do
    context "user visits /items" do
      scenario "user can see all existing items" do
          pogs = Category.create(title: "Pogs")
          item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs)
          item_2 = pogs.items.create(title: "Power Rangers Packet", price: 30.99, description: "Power Ranger Packet", image_path: 'power_rangers_packet.png', category: pogs)

          visit items_path

          expect(page).to have_content("Pogs")

           expect(page).to have_content("McDonald's Rangers")
           expect(page).to have_css("img[src*='power_rangers.jpg']")

          expect(page).to have_content("Power Rangers Packet")
          expect(page).to have_css("img[src*='power_rangers_packet.png']")
    end
  end
end
