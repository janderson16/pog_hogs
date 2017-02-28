require 'rails_helper'

describe "Admin can see all orders" do
  context "as an authenticated admin" do
    scenario "and they visit admin dashboard" do
      admin = User.create(
                         first_name: "Samuel",
                         last_name: "McKeen",
                         email: "SamMcKeen@gmail.com",
                         password: "password",
                         role: 1
                         )
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
     category = Category.create(title: "Pogs")
     item_1 = category.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Coins", image_path: 'power_rangers.jpg', category: category)
     item_2 = category.items.create(title: "Power Rangers", price: 24.99, description: "Power Ranger Pog", image_path: 'power_rangers.jpg', category: category)
     user_1 = User.create(
                        first_name: "John",
                        last_name: "Doe",
                        email: "johndoe@gmail.com",
                        password: "password"
                        )
     user_2 = User.create(
                        first_name: "Rick",
                        last_name: "Reynolds",
                        email: "RR@gmail.com",
                        password: "password",
                        )
     order_1 = Order.create(user_id: user_1.id)
     order_item = OrderItem.create(quantity: 2, item_id: item_1.id, order_id: order_1.id)
     order_2 = Order.create(user_id: user_2.id)
     order_item = OrderItem.create(quantity: 3, item_id: item_2.id, order_id: order_2.id)

      visit 'admin/dashboard'
      expect(page).to have_content "Ordered: 2"
      expect(page).to have_content "Paid: 0"
      expect(page).to have_content "Order Number: #{order_1.id}"
      expect(page).to have_content "#{order_1.updated_at.strftime("%l:%M%P, %d %b. %Y")}"

    end
  end
end
