require 'rails_helper'

RSpec.feature "Authenticated User" do
  scenario 'is able to see order history' do
    pogs = Category.create(title: "Pogs")
    item_1 = pogs.items.create(
            title: "eight_ball_pack",
            price: 10.99,
            description: "30 assorted 8-ball themed pogs.",
            image_path: '8ballpogs.jpg',
            category: pogs
            )
    item_2 = pogs.items.create(
            title: "NFL_pack",
            price: 15.99,
            description: "32 pog set; one for each NFL team!",
            image_path: 'NFL-Team-Caps.jpg',
            category: pogs
            )

    slammers = Category.create(title: "Slammers")
    item_3 = slammers.items.create(
            title: "trex",
            price: 3.50,
            description: "Holographic T-Rex slammer.",
            image_path: 't_rex_slammer.JPG',
            category: slammers
            )

    user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "johndoe@gmail.com",
          password: "password"
          )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit items_path

    within(".eight_ball_pack") do
        click_on 'Add to Cart'
    end

    within(".NFL_pack") do
        click_on 'Add to Cart'
    end

    click_on 'My Cart'
    click_on 'Proceed to checkout'

    expect(page).to have_content("Order was successfully placed")

    visit items_path

    within(".trex") do
        click_on 'Add to Cart'
    end

    click_on 'My Cart'
    click_on 'Proceed to checkout'

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(user.orders.first.id)
    expect(page).to have_content(user.orders.last.id)
    expect(page).to have_content("1 item")
    expect(page).to have_content("2 items")
  end

end
