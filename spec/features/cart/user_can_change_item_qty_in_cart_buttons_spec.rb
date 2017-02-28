require 'rails_helper'

RSpec.feature "User" do
  xcontext "clicks button to increase/decrease item quantity" do
    scenario "item quantity is changed" do
      slammers = Category.create!(title: "Slammers")
      item = slammers.items.create!(title: "Lion Holographic Slammer",
                                        price: 3.25,
                                        description: "1/4 thick brass, saw-shaped slammer with holographic lion",
                                        image_path: "http://www.the90swereawesome.com/wp-content/uploads/2014/08/intricate.jpg"
                                        )

      visit items_path

      click_button "Add to Cart"

      expect(page).to have_content("You now have 1 Lion Holographic Slammer.")

      click_on 'My Cart'

      within(".cart_item") do
        expect(page).to have_content(1)
      end

      expect(page).to have_content("Total: $3.25")

      click_on '+'

      within(".cart_item") do
        expect(page).to have_content(2)
      end

      expect(page).to have_content("Total: $6.50")

      click_on '-'

      within(".cart_item") do
        expect(page).to have_content(1)
      end

      expect(page).to have_content("Total: $3.25")

    end
  end
end
