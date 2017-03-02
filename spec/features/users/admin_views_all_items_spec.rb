require 'rails_helper'

RSpec.feature "Admin" do
  scenario "can view all items" do
    pogs = Category.create(title: "Pogs")
    item_1 = pogs.items.create(
            title: "eight_ball_pack",
            price: 10.99,
            description: "30 assorted 8-ball themed pogs.",
            image_path: 'https://ironcladfolly.files.wordpress.com/2013/11/8ballpogs.jpg',
            category: pogs
            )

    slammers = Category.create(title: "Slammers")
    item_2 = slammers.items.create(
            title: "mike_tyson",
            price: 7.99,
            description: "No slammer slams harder than Iron Mike Tyson!",
            image_path: 'http://i.ebayimg.com/images/g/VS8AAOSw9r1WATVk/s-l300.jpg',
            category: slammers,
            status: 1
            )
    admin = User.create(
                       first_name: "John",
                       last_name: "Doe",
                       email: "johndoe@gmail.com",
                       password: "password",
                       role: 1
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_on("Items Index")

    expect(current_path).to eq("/admin/items")

    within(".eight_ball_pack") do
      expect(page).to have_xpath("//img[contains(@src,'https://ironcladfolly.files.wordpress.com/2013/11/8ballpogs.jpg')]")
      expect(page).to have_content("30 assorted 8-ball themed pogs.")
      expect(page).to have_content("active")
      find_button("Edit").visible?
    end

    within(".mike_tyson") do
      expect(page).to have_xpath("//img[contains(@src,'http://i.ebayimg.com/images/g/VS8AAOSw9r1WATVk/s-l300.jpg')]")
      expect(page).to have_content("No slammer slams harder than Iron Mike Tyson!")
      expect(page).to have_content("retired")
      find_button("Edit").visible?
    end

  end
end
