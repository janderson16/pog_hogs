require 'rails_helper'

describe "Admin can edit an item" do
  scenario "when they visit the admin dashboard" do
    admin = User.create(
                       first_name: "Samuel",
                       last_name: "McKeen",
                       email: "SamMcKeen@gmail.com",
                       password: "password",
                       role: 1
                       )
    pogs = Category.create(title: "Pogs")
    sets = Category.create(title: "Sets")
    item = pogs.items.create(title: "McDonald's Rangers", price: 24.99, description: "McDonald's Power Ranger Pogs", image_path: 'power_rangers.jpg', category: pogs)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit edit_admin_item_path(item)
    fill_in "item[description]", with: "Clearance item"
    select "Sets", from: "item[category_id]"
    fill_in "item[price]", with: 12.73
    click_button "Update Item"
    expect(page).to have_content "Sets"
    expect(page).to have_content "Clearance item"
    expect(page).to have_content "12.73"
  end
end
