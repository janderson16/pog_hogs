require 'rails_helper'

RSpec.feature "Authenticated User" do
  scenario 'is able to checkout after logging in' do
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(
          title: "8-ball pack",
          price: 10.99,
          description: "30 assorted 8-ball themed pogs.",
          image_path: '8ballpogs.jpg',
          category: pogs
          )
    user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "johndoe@gmail.com",
          password: "password"
          )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit items_path
    click_on 'Add to Cart'
    click_on 'My Cart'
    click_on 'Proceed to checkout'

    expect(current_path).to eq(orders_path)
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(user.orders.first.id)
    expect(page).to have_content("1 item")
  end

end
