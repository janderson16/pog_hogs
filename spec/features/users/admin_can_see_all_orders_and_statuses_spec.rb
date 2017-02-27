require 'rails_helper'
#issue 15 & 16
describe "Admin can log in" do
  context "as an authenticated admin" do
    scenario "and they visit admin dashboard" do
      order_1 = Order.create
      admin = User.create(
                         first_name: "Samuel",
                         last_name: "McKeen",
                         email: "SamMcKeen@gmail.com",
                         password: "password",
                         role: 1
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit 'admin/dashboard'
      expect(page).to have_content "Orders"
      expect(page).to have_content "Ordered"
      expect(page).to have_content "Paid"
      expect(page).to have_content "Completed"
      expect(page).to have_content "Cancelled"



As an Admin
When I visit the dashboard
Then I can see a listing of all orders
And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
And I can see a link for each individual order
And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
And I have links to transition between statuses
- I can click on "cancel" on individual orders which are "paid" or "ordered"
- I can click on "mark as paid" on orders that are "ordered"
- I can click on "mark as completed" on orders that are "paid"
