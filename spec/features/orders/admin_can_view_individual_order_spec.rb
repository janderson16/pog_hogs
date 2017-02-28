require 'rails_helper'

RSpec.feature "Admin can see individual order" do
  scenario "from admin dashboard page" do
    admin = User.create(
                       first_name: "Samuel",
                       last_name: "McKeen",
                       email: "SamMcKeen@gmail.com",
                       password: "password",
                       role: 1
                       )
    pogs = Category.create(title: "Pogs")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: pogs)
    user = User.create(
                       first_name: "John",
                       last_name: "Doe",
                       email: "johndoe@gmail.com",
                       password: "password",
                       address: "5120 S. 109th Ave. New York, NY 10002"
                       )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    order = Order.create(user_id: user.id, status: 1)
    order_item = OrderItem.create(quantity: 2, item_id: item.id, order_id: order.id)

    visit 'admin/dashboard'
    click_on "Order Number: #{order.id}"
    expect(page).to have_content("Customer Number: #{user.id}")
    expect(page).to have_content("Status: PAID")
    expect(page).to have_content("Order Total: $24.99")
    expect(page).to have_content("Customer Address: 5120 S. 109th Ave. New York, NY 10002")
    expect(page).to have_link("McDonald's Rangers")
  end
end
